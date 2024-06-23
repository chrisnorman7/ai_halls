import 'package:drift/drift.dart';

/// Add a [id] column.
mixin IdMixin on Table {
  /// The id column.
  IntColumn get id => integer().autoIncrement()();
}

/// Add a [name] column.
mixin NameMixin on Table {
  /// The name column.
  TextColumn get name => text()();
}

/// Add a [description] column.
mixin DescriptionMixin on Table {
  /// The description column.
  TextColumn get description => text()();
}

/// Add [x] and [y] columns.
mixin CoordinatesMixin on Table {
  /// The x coordinate.
  IntColumn get x => integer().withDefault(const Constant(0))();

  /// The y coordinate.
  IntColumn get y => integer().withDefault(const Constant(0))();
}
