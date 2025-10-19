import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/profile_entity.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

// Helper functions for Timestamp conversion (must be outside the class)
DateTime? _timestampFromJson(dynamic value) {
  if (value == null) return null;
  if (value is Timestamp) return value.toDate();
  if (value is String) return DateTime.parse(value);
  return null;
}

dynamic _timestampToJson(DateTime? dateTime) {
  if (dateTime == null) return null;
  return Timestamp.fromDate(dateTime);
}

@freezed
abstract class ProfileModel with _$ProfileModel {
  const ProfileModel._();

  const factory ProfileModel({
    required String userId,
    required String fullName,
    required String nickname,
    required String email,
    required String phoneNumber,
    required String countryCode,
    required String gender,
    String? photoUrl,
    List<int>? favoriteIds,
    List<int>? wishlistIds,

    // ignore: invalid_annotation_target
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
        DateTime? createdAt,
    // ignore: invalid_annotation_target
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
        DateTime? updatedAt,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  factory ProfileModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ProfileModel.fromJson(data);
  }

  ProfileEntity toEntity() {
    return ProfileEntity(
      userId: userId,
      fullName: fullName,
      nickname: nickname,
      email: email,
      phoneNumber: phoneNumber,
      countryCode: countryCode,
      favoriteIds: favoriteIds,
      wishlistIds: wishlistIds,
      gender: gender,
      photoUrl: photoUrl,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
