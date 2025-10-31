// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, duplicate_ignore
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileModel {

 String get userId; String get fullName; String get nickname; String get email; String get phoneNumber; String get countryCode; String get gender; String? get photoUrl; List<int>? get favoriteMoviesIds; List<int>? get favoriteTvIds; List<int>? get favoritePersonIds; List<int>? get wishlistMoviesIds; List<int>? get wishlistTvIds;// ignore: invalid_annotation_target
@JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson) DateTime? get createdAt;// ignore: invalid_annotation_target
@JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson) DateTime? get updatedAt;
/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileModelCopyWith<ProfileModel> get copyWith => _$ProfileModelCopyWithImpl<ProfileModel>(this as ProfileModel, _$identity);

  /// Serializes this ProfileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&const DeepCollectionEquality().equals(other.favoriteMoviesIds, favoriteMoviesIds)&&const DeepCollectionEquality().equals(other.favoriteTvIds, favoriteTvIds)&&const DeepCollectionEquality().equals(other.favoritePersonIds, favoritePersonIds)&&const DeepCollectionEquality().equals(other.wishlistMoviesIds, wishlistMoviesIds)&&const DeepCollectionEquality().equals(other.wishlistTvIds, wishlistTvIds)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,fullName,nickname,email,phoneNumber,countryCode,gender,photoUrl,const DeepCollectionEquality().hash(favoriteMoviesIds),const DeepCollectionEquality().hash(favoriteTvIds),const DeepCollectionEquality().hash(favoritePersonIds),const DeepCollectionEquality().hash(wishlistMoviesIds),const DeepCollectionEquality().hash(wishlistTvIds),createdAt,updatedAt);

@override
String toString() {
  return 'ProfileModel(userId: $userId, fullName: $fullName, nickname: $nickname, email: $email, phoneNumber: $phoneNumber, countryCode: $countryCode, gender: $gender, photoUrl: $photoUrl, favoriteMoviesIds: $favoriteMoviesIds, favoriteTvIds: $favoriteTvIds, favoritePersonIds: $favoritePersonIds, wishlistMoviesIds: $wishlistMoviesIds, wishlistTvIds: $wishlistTvIds, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ProfileModelCopyWith<$Res>  {
  factory $ProfileModelCopyWith(ProfileModel value, $Res Function(ProfileModel) _then) = _$ProfileModelCopyWithImpl;
@useResult
$Res call({
 String userId, String fullName, String nickname, String email, String phoneNumber, String countryCode, String gender, String? photoUrl, List<int>? favoriteMoviesIds, List<int>? favoriteTvIds, List<int>? favoritePersonIds, List<int>? wishlistMoviesIds, List<int>? wishlistTvIds,@JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson) DateTime? createdAt,@JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson) DateTime? updatedAt
});




}
/// @nodoc
class _$ProfileModelCopyWithImpl<$Res>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._self, this._then);

  final ProfileModel _self;
  final $Res Function(ProfileModel) _then;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? fullName = null,Object? nickname = null,Object? email = null,Object? phoneNumber = null,Object? countryCode = null,Object? gender = null,Object? photoUrl = freezed,Object? favoriteMoviesIds = freezed,Object? favoriteTvIds = freezed,Object? favoritePersonIds = freezed,Object? wishlistMoviesIds = freezed,Object? wishlistTvIds = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,favoriteMoviesIds: freezed == favoriteMoviesIds ? _self.favoriteMoviesIds : favoriteMoviesIds // ignore: cast_nullable_to_non_nullable
as List<int>?,favoriteTvIds: freezed == favoriteTvIds ? _self.favoriteTvIds : favoriteTvIds // ignore: cast_nullable_to_non_nullable
as List<int>?,favoritePersonIds: freezed == favoritePersonIds ? _self.favoritePersonIds : favoritePersonIds // ignore: cast_nullable_to_non_nullable
as List<int>?,wishlistMoviesIds: freezed == wishlistMoviesIds ? _self.wishlistMoviesIds : wishlistMoviesIds // ignore: cast_nullable_to_non_nullable
as List<int>?,wishlistTvIds: freezed == wishlistTvIds ? _self.wishlistTvIds : wishlistTvIds // ignore: cast_nullable_to_non_nullable
as List<int>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileModel].
extension ProfileModelPatterns on ProfileModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfileModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String fullName,  String nickname,  String email,  String phoneNumber,  String countryCode,  String gender,  String? photoUrl,  List<int>? favoriteMoviesIds,  List<int>? favoriteTvIds,  List<int>? favoritePersonIds,  List<int>? wishlistMoviesIds,  List<int>? wishlistTvIds, @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)  DateTime? createdAt, @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that.userId,_that.fullName,_that.nickname,_that.email,_that.phoneNumber,_that.countryCode,_that.gender,_that.photoUrl,_that.favoriteMoviesIds,_that.favoriteTvIds,_that.favoritePersonIds,_that.wishlistMoviesIds,_that.wishlistTvIds,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String fullName,  String nickname,  String email,  String phoneNumber,  String countryCode,  String gender,  String? photoUrl,  List<int>? favoriteMoviesIds,  List<int>? favoriteTvIds,  List<int>? favoritePersonIds,  List<int>? wishlistMoviesIds,  List<int>? wishlistTvIds, @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)  DateTime? createdAt, @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ProfileModel():
return $default(_that.userId,_that.fullName,_that.nickname,_that.email,_that.phoneNumber,_that.countryCode,_that.gender,_that.photoUrl,_that.favoriteMoviesIds,_that.favoriteTvIds,_that.favoritePersonIds,_that.wishlistMoviesIds,_that.wishlistTvIds,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String fullName,  String nickname,  String email,  String phoneNumber,  String countryCode,  String gender,  String? photoUrl,  List<int>? favoriteMoviesIds,  List<int>? favoriteTvIds,  List<int>? favoritePersonIds,  List<int>? wishlistMoviesIds,  List<int>? wishlistTvIds, @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)  DateTime? createdAt, @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that.userId,_that.fullName,_that.nickname,_that.email,_that.phoneNumber,_that.countryCode,_that.gender,_that.photoUrl,_that.favoriteMoviesIds,_that.favoriteTvIds,_that.favoritePersonIds,_that.wishlistMoviesIds,_that.wishlistTvIds,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileModel extends ProfileModel {
  const _ProfileModel({required this.userId, required this.fullName, required this.nickname, required this.email, required this.phoneNumber, required this.countryCode, required this.gender, this.photoUrl, final  List<int>? favoriteMoviesIds, final  List<int>? favoriteTvIds, final  List<int>? favoritePersonIds, final  List<int>? wishlistMoviesIds, final  List<int>? wishlistTvIds, @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson) this.createdAt, @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson) this.updatedAt}): _favoriteMoviesIds = favoriteMoviesIds,_favoriteTvIds = favoriteTvIds,_favoritePersonIds = favoritePersonIds,_wishlistMoviesIds = wishlistMoviesIds,_wishlistTvIds = wishlistTvIds,super._();
  factory _ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);

@override final  String userId;
@override final  String fullName;
@override final  String nickname;
@override final  String email;
@override final  String phoneNumber;
@override final  String countryCode;
@override final  String gender;
@override final  String? photoUrl;
 final  List<int>? _favoriteMoviesIds;
@override List<int>? get favoriteMoviesIds {
  final value = _favoriteMoviesIds;
  if (value == null) return null;
  if (_favoriteMoviesIds is EqualUnmodifiableListView) return _favoriteMoviesIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<int>? _favoriteTvIds;
@override List<int>? get favoriteTvIds {
  final value = _favoriteTvIds;
  if (value == null) return null;
  if (_favoriteTvIds is EqualUnmodifiableListView) return _favoriteTvIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<int>? _favoritePersonIds;
@override List<int>? get favoritePersonIds {
  final value = _favoritePersonIds;
  if (value == null) return null;
  if (_favoritePersonIds is EqualUnmodifiableListView) return _favoritePersonIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<int>? _wishlistMoviesIds;
@override List<int>? get wishlistMoviesIds {
  final value = _wishlistMoviesIds;
  if (value == null) return null;
  if (_wishlistMoviesIds is EqualUnmodifiableListView) return _wishlistMoviesIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<int>? _wishlistTvIds;
@override List<int>? get wishlistTvIds {
  final value = _wishlistTvIds;
  if (value == null) return null;
  if (_wishlistTvIds is EqualUnmodifiableListView) return _wishlistTvIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

// ignore: invalid_annotation_target
@override@JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson) final  DateTime? createdAt;
// ignore: invalid_annotation_target
@override@JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson) final  DateTime? updatedAt;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileModelCopyWith<_ProfileModel> get copyWith => __$ProfileModelCopyWithImpl<_ProfileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&const DeepCollectionEquality().equals(other._favoriteMoviesIds, _favoriteMoviesIds)&&const DeepCollectionEquality().equals(other._favoriteTvIds, _favoriteTvIds)&&const DeepCollectionEquality().equals(other._favoritePersonIds, _favoritePersonIds)&&const DeepCollectionEquality().equals(other._wishlistMoviesIds, _wishlistMoviesIds)&&const DeepCollectionEquality().equals(other._wishlistTvIds, _wishlistTvIds)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,fullName,nickname,email,phoneNumber,countryCode,gender,photoUrl,const DeepCollectionEquality().hash(_favoriteMoviesIds),const DeepCollectionEquality().hash(_favoriteTvIds),const DeepCollectionEquality().hash(_favoritePersonIds),const DeepCollectionEquality().hash(_wishlistMoviesIds),const DeepCollectionEquality().hash(_wishlistTvIds),createdAt,updatedAt);

@override
String toString() {
  return 'ProfileModel(userId: $userId, fullName: $fullName, nickname: $nickname, email: $email, phoneNumber: $phoneNumber, countryCode: $countryCode, gender: $gender, photoUrl: $photoUrl, favoriteMoviesIds: $favoriteMoviesIds, favoriteTvIds: $favoriteTvIds, favoritePersonIds: $favoritePersonIds, wishlistMoviesIds: $wishlistMoviesIds, wishlistTvIds: $wishlistTvIds, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ProfileModelCopyWith<$Res> implements $ProfileModelCopyWith<$Res> {
  factory _$ProfileModelCopyWith(_ProfileModel value, $Res Function(_ProfileModel) _then) = __$ProfileModelCopyWithImpl;
@override @useResult
$Res call({
 String userId, String fullName, String nickname, String email, String phoneNumber, String countryCode, String gender, String? photoUrl, List<int>? favoriteMoviesIds, List<int>? favoriteTvIds, List<int>? favoritePersonIds, List<int>? wishlistMoviesIds, List<int>? wishlistTvIds,@JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson) DateTime? createdAt,@JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson) DateTime? updatedAt
});




}
/// @nodoc
class __$ProfileModelCopyWithImpl<$Res>
    implements _$ProfileModelCopyWith<$Res> {
  __$ProfileModelCopyWithImpl(this._self, this._then);

  final _ProfileModel _self;
  final $Res Function(_ProfileModel) _then;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? fullName = null,Object? nickname = null,Object? email = null,Object? phoneNumber = null,Object? countryCode = null,Object? gender = null,Object? photoUrl = freezed,Object? favoriteMoviesIds = freezed,Object? favoriteTvIds = freezed,Object? favoritePersonIds = freezed,Object? wishlistMoviesIds = freezed,Object? wishlistTvIds = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_ProfileModel(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,favoriteMoviesIds: freezed == favoriteMoviesIds ? _self._favoriteMoviesIds : favoriteMoviesIds // ignore: cast_nullable_to_non_nullable
as List<int>?,favoriteTvIds: freezed == favoriteTvIds ? _self._favoriteTvIds : favoriteTvIds // ignore: cast_nullable_to_non_nullable
as List<int>?,favoritePersonIds: freezed == favoritePersonIds ? _self._favoritePersonIds : favoritePersonIds // ignore: cast_nullable_to_non_nullable
as List<int>?,wishlistMoviesIds: freezed == wishlistMoviesIds ? _self._wishlistMoviesIds : wishlistMoviesIds // ignore: cast_nullable_to_non_nullable
as List<int>?,wishlistTvIds: freezed == wishlistTvIds ? _self._wishlistTvIds : wishlistTvIds // ignore: cast_nullable_to_non_nullable
as List<int>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
