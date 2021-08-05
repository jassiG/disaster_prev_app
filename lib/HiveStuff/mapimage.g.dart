// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mapimage.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MapImageAdapter extends TypeAdapter<MapImage> {
  @override
  final int typeId = 1;

  @override
  MapImage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MapImage(
      fields[0] as String,
      fields[1] as Coord,
      fields[2] as Coord,
      fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MapImage obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.path)
      ..writeByte(1)
      ..write(obj.ne_coord)
      ..writeByte(2)
      ..write(obj.sw_coord)
      ..writeByte(3)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MapImageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
