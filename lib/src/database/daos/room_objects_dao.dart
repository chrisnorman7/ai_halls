import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/room_objects.dart';

part 'room_objects_dao.g.dart';

/// The room objects DAO.
@DriftAccessor(tables: [RoomObjects])
class RoomObjectsDao extends DatabaseAccessor<Database>
    with _$RoomObjectsDaoMixin {
  /// Create an instance.
  RoomObjectsDao(super.db);
}
