// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_image.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InventoryImageAdapter extends TypeAdapter<InventoryImage> {
  @override
  final int typeId = 0;

  @override
  InventoryImage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InventoryImage(
      link: fields[0] as String,
      identify: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, InventoryImage obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.link)
      ..writeByte(1)
      ..write(obj.identify);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InventoryImageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
