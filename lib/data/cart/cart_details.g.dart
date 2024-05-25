// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartDetailsAdapter extends TypeAdapter<CartDetails> {
  @override
  final int typeId = 0;

  @override
  CartDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartDetails(
      name: fields[1] as String?,
      price: fields[0] as String?,
      quantity: fields[3] as int?,
      slug: fields[2] as String?,
      image: fields[5] as String?,
    )..total = fields[4] as int?;
  }

  @override
  void write(BinaryWriter writer, CartDetails obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.price)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.quantity)
      ..writeByte(4)
      ..write(obj.total)
      ..writeByte(5)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
