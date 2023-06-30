// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RegistrationDataModelAdapter extends TypeAdapter<RegistrationDataModel> {
  @override
  final int typeId = 0;

  @override
  RegistrationDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RegistrationDataModel()
      ..name = fields[0] as String?
      ..birthday = fields[1] as DateTime?
      ..experienceLevel = fields[2] as String?
      ..languages = (fields[3] as List).cast<String>()
      ..experienceTime = fields[4] as int?
      ..salary = fields[5] as double?;
  }

  @override
  void write(BinaryWriter writer, RegistrationDataModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.birthday)
      ..writeByte(2)
      ..write(obj.experienceLevel)
      ..writeByte(3)
      ..write(obj.languages)
      ..writeByte(4)
      ..write(obj.experienceTime)
      ..writeByte(5)
      ..write(obj.salary);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegistrationDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
