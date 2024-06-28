import 'dart:convert';
import 'dart:math';

import 'package:dart_openai/dart_openai.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'database/database.dart';
import 'json/rooms/generated_room.dart';
import 'json/rooms/generated_room_exit.dart';
import 'json/rooms/generated_room_object.dart';
import 'providers/providers.dart';

/// The type of a JSON map.
typedef JsonMap = Map<String, dynamic>;

/// Generate a room.
Future<Room> generateRoom({
  required final WidgetRef ref,
  required final World world,
}) async {
  final options = await ref.read(gameOptionsProvider.future);
  final apiKey = options.apiKey;
  if (apiKey == null) {
    throw StateError('The API key has not yet been set.');
  }
  OpenAI.apiKey = apiKey;
  const exampleRoom = GeneratedRoom(
    name: 'The name of this room',
    description: 'The description of this room.',
    ambiance: 'A random entry from {ambiances}',
    width: 0,
    length: 0,
    objects: [],
    exits: [],
  );
  final roomJson = exampleRoom.toJson();
  roomJson['width'] = 'The width of this room in metres as an integer';
  roomJson['length'] = 'The length of this room in metres as an integer';
  const roomObject = GeneratedRoomObject(
    name: 'The name of this object',
    description: 'The description of this object',
    x: 0,
    y: 0,
  );
  final objectJson = roomObject.toJson();
  objectJson['x'] =
      'The number of metres across the room where this object lives. Should be '
      'less than `width`';
  objectJson['y'] =
      'The number of metres into the room where this object lives. Should be '
      'less than `length`';
  roomJson['objects'] = [objectJson];
  const roomExit = GeneratedRoomExit(
    name: 'The name of this exit',
    description: 'The description of this exit',
    x: 0,
    y: 0,
  );
  final exitJson = roomExit.toJson();
  exitJson['x'] =
      'The number of metres across the room where this exit lives. Should be '
      'less than `width`';
  exitJson['y'] =
      'The number of metres into the room where this exit lives. Should be '
      'less than `length`';
  roomJson['exits'] = [exitJson];
  final api = OpenAI.instance;
  final stringBuffer = StringBuffer()
    ..writeln('You are helping build a world called "${world.name}".')
    ..writeln('The description of this world is: ${world.description}')
    ..writeln('Ensure all rooms conform to the following JSON schema:')
    ..writeln(jsonEncode(roomJson));
  final database = ref.read(databaseProvider);
  stringBuffer.writeln(
    'When creating rooms, create at least one object and one exit.',
  );
  final systemMessage = OpenAIChatCompletionChoiceMessageModel(
    content: [
      OpenAIChatCompletionChoiceMessageContentItemModel.text(
        stringBuffer.toString(),
      ),
    ],
    role: OpenAIChatMessageRole.assistant,
  );
  final rooms = await database.roomsDao.getRooms(world);
  final String prompt;
  if (rooms.isEmpty) {
    prompt = 'Create the initial room for this world.';
  } else {
    prompt = 'Create a room for this world.';
  }
  final instructionMessage = OpenAIChatCompletionChoiceMessageModel(
    role: OpenAIChatMessageRole.user,
    content: [
      OpenAIChatCompletionChoiceMessageContentItemModel.text(prompt),
    ],
  );
  final messages = [systemMessage];
  for (final room in rooms) {
    messages.addAll(
      [
        OpenAIChatCompletionChoiceMessageModel(
          role: OpenAIChatMessageRole.user,
          content: [
            OpenAIChatCompletionChoiceMessageContentItemModel.text(room.prompt),
          ],
        ),
        OpenAIChatCompletionChoiceMessageModel(
          role: OpenAIChatMessageRole.system,
          content: [
            OpenAIChatCompletionChoiceMessageContentItemModel.text(
              room.jsonSchema,
            ),
          ],
        ),
      ],
    );
  }
  messages.add(instructionMessage);
  final chat = await api.chat.create(
    model: 'gpt-3.5-turbo-1106',
    responseFormat: {'type': 'json_object'},
    messages: messages,
  );
  final choice = chat.choices.first.message;
  final text = choice.content?.single.text;
  if (text == null) {
    throw StateError('The API returned `null`.');
  }
  final generatedRoom = GeneratedRoom.fromJson(
    jsonDecode(text) as Map<String, dynamic>,
  );
  final room = await database.roomsDao.createRoom(
    world: world,
    name: generatedRoom.name,
    description: generatedRoom.description,
    width: generatedRoom.width,
    length: generatedRoom.length,
    prompt: prompt,
    jsonSchema: text,
  );
  for (final object in generatedRoom.objects) {
    await database.roomObjectsDao.createRoomObject(
      location: room,
      name: object.name,
      description: object.description,
      coordinates: Point(object.x, object.y),
    );
  }
  for (final exit in generatedRoom.exits) {
    await database.roomExitsDao.createRoomExit(
      location: room,
      name: exit.name,
      description: exit.description,
      coordinates: Point(exit.x, exit.y),
    );
  }
  return room;
}
