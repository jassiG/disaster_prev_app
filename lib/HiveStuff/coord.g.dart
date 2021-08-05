// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coord.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoordAdapter extends TypeAdapter<Coord> {
  @override
  final int typeId = 0;

  @override
  Coord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Coord(
      fields[0] as double,
      fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Coord obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.lat)
      ..writeByte(1)
      ..write(obj.long);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
