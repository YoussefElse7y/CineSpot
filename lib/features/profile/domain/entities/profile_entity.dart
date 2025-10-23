import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_entity.freezed.dart';

@freezed
abstract class ProfileEntity with _$ProfileEntity {
  const factory ProfileEntity({
    required String userId,
    required String fullName,
    required String nickname,
    required String email,
    required String phoneNumber,
    required String countryCode,
    required String gender,
    List<int>? favoriteMoviesIds,
    List<int>? favoriteTvIds,
    List<int>? favoritePersonIds,
    List<int>? wishlistMoviesIds,
    List<int>? wishlistTvIds,
    String? photoUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ProfileEntity;
}