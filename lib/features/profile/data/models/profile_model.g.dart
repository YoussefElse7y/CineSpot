// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) =>
    _ProfileModel(
      userId: json['userId'] as String,
      fullName: json['fullName'] as String,
      nickname: json['nickname'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      countryCode: json['countryCode'] as String,
      gender: json['gender'] as String,
      photoUrl: json['photoUrl'] as String?,
      favoriteIds: (json['favoriteIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      wishlistIds: (json['wishlistIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      createdAt: _timestampFromJson(json['createdAt']),
      updatedAt: _timestampFromJson(json['updatedAt']),
    );

Map<String, dynamic> _$ProfileModelToJson(_ProfileModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'fullName': instance.fullName,
      'nickname': instance.nickname,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'countryCode': instance.countryCode,
      'gender': instance.gender,
      'photoUrl': instance.photoUrl,
      'favoriteIds': instance.favoriteIds,
      'wishlistIds': instance.wishlistIds,
      'createdAt': _timestampToJson(instance.createdAt),
      'updatedAt': _timestampToJson(instance.updatedAt),
    };
