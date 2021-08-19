// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_2_coord.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Inventory2CoordAdapter extends TypeAdapter<Inventory2Coord> {
  @override
  final int typeId = 2;

  @override
  Inventory2Coord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Inventory2Coord(
      link: fields[0] as String,
      x: fields[1] as double,
      y: fields[2] as double,
      classification: fields[3] as int,
      witness: fields[4] as String,
      year: fields[6] as int,
      month: fields[7] as int,
      day: fields[8] as int,
      content: fields[9] as String,
      image: fields[10] as String,
      identify: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Inventory2Coord obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.link)
      ..writeByte(1)
      ..write(obj.x)
      ..writeByte(2)
      ..write(obj.y)
      ..writeByte(3)
      ..write(obj.classification)
      ..writeByte(4)
      ..write(obj.witness)
      ..writeByte(6)
      ..write(obj.year)
      ..writeByte(7)
      ..write(obj.month)
      ..writeByte(8)
      ..write(obj.day)
      ..writeByte(9)
      ..write(obj.content)
      ..writeByte(10)
      ..write(obj.image)
      ..writeByte(11)
      ..write(obj.identify);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Inventory2CoordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
