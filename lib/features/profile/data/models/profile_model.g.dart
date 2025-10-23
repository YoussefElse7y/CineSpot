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
      favoriteMoviesIds: (json['favoriteMoviesIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      favoriteTvIds: (json['favoriteTvIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      favoritePersonIds: (json['favoritePersonIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      wishlistMoviesIds: (json['wishlistMoviesIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      wishlistTvIds: (json['wishlistTvIds'] as List<dynamic>?)
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
      'favoriteMoviesIds': instance.favoriteMoviesIds,
      'favoriteTvIds': instance.favoriteTvIds,
      'favoritePersonIds': instance.favoritePersonIds,
      'wishlistMoviesIds': instance.wishlistMoviesIds,
      'wishlistTvIds': instance.wishlistTvIds,
      'createdAt': _timestampToJson(instance.createdAt),
      'updatedAt': _timestampToJson(instance.updatedAt),
    };
