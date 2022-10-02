// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 10;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[0] as int,
      login: fields[1] as String,
      password: fields[2] as String,
      token: fields[3] as String,
      userFreezer: (fields[4] as List).cast<Freezer>(),
      favoriteRecipes: (fields[5] as List).cast<Favorite>(),
      comments: (fields[6] as List).cast<Comment>(),
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.login)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.token)
      ..writeByte(4)
      ..write(obj.userFreezer)
      ..writeByte(5)
      ..write(obj.favoriteRecipes)
      ..writeByte(6)
      ..write(obj.comments);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      login: json['login'] as String,
      password: json['password'] as String,
      token: json['token'] as String,
      userFreezer: (json['userFreezer'] as List<dynamic>)
          .map((e) => Freezer.fromJson(e as Map<String, dynamic>))
          .toList(),
      favoriteRecipes: (json['favoriteRecipes'] as List<dynamic>)
          .map((e) => Favorite.fromJson(e as Map<String, dynamic>))
          .toList(),
      comments: (json['comments'] as List<dynamic>)
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'password': instance.password,
      'token': instance.token,
      'userFreezer': instance.userFreezer,
      'favoriteRecipes': instance.favoriteRecipes,
      'comments': instance.comments,
    };
