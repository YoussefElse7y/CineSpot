// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent()';
}


}

/// @nodoc
class $ProfileEventCopyWith<$Res>  {
$ProfileEventCopyWith(ProfileEvent _, $Res Function(ProfileEvent) __);
}


/// Adds pattern-matching-related methods to [ProfileEvent].
extension ProfileEventPatterns on ProfileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CreateProfile value)?  createProfile,TResult Function( UpdateProfile value)?  updateProfile,TResult Function( LoadProfile value)?  loadProfile,TResult Function( CheckProfileExists value)?  checkProfileExists,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreateProfile() when createProfile != null:
return createProfile(_that);case UpdateProfile() when updateProfile != null:
return updateProfile(_that);case LoadProfile() when loadProfile != null:
return loadProfile(_that);case CheckProfileExists() when checkProfileExists != null:
return checkProfileExists(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CreateProfile value)  createProfile,required TResult Function( UpdateProfile value)  updateProfile,required TResult Function( LoadProfile value)  loadProfile,required TResult Function( CheckProfileExists value)  checkProfileExists,}){
final _that = this;
switch (_that) {
case CreateProfile():
return createProfile(_that);case UpdateProfile():
return updateProfile(_that);case LoadProfile():
return loadProfile(_that);case CheckProfileExists():
return checkProfileExists(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CreateProfile value)?  createProfile,TResult? Function( UpdateProfile value)?  updateProfile,TResult? Function( LoadProfile value)?  loadProfile,TResult? Function( CheckProfileExists value)?  checkProfileExists,}){
final _that = this;
switch (_that) {
case CreateProfile() when createProfile != null:
return createProfile(_that);case UpdateProfile() when updateProfile != null:
return updateProfile(_that);case LoadProfile() when loadProfile != null:
return loadProfile(_that);case CheckProfileExists() when checkProfileExists != null:
return checkProfileExists(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ProfileEntity profile,  File? imageFile)?  createProfile,TResult Function( ProfileEntity profile,  File? imageFile)?  updateProfile,TResult Function( String userId)?  loadProfile,TResult Function( String userId)?  checkProfileExists,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CreateProfile() when createProfile != null:
return createProfile(_that.profile,_that.imageFile);case UpdateProfile() when updateProfile != null:
return updateProfile(_that.profile,_that.imageFile);case LoadProfile() when loadProfile != null:
return loadProfile(_that.userId);case CheckProfileExists() when checkProfileExists != null:
return checkProfileExists(_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ProfileEntity profile,  File? imageFile)  createProfile,required TResult Function( ProfileEntity profile,  File? imageFile)  updateProfile,required TResult Function( String userId)  loadProfile,required TResult Function( String userId)  checkProfileExists,}) {final _that = this;
switch (_that) {
case CreateProfile():
return createProfile(_that.profile,_that.imageFile);case UpdateProfile():
return updateProfile(_that.profile,_that.imageFile);case LoadProfile():
return loadProfile(_that.userId);case CheckProfileExists():
return checkProfileExists(_that.userId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ProfileEntity profile,  File? imageFile)?  createProfile,TResult? Function( ProfileEntity profile,  File? imageFile)?  updateProfile,TResult? Function( String userId)?  loadProfile,TResult? Function( String userId)?  checkProfileExists,}) {final _that = this;
switch (_that) {
case CreateProfile() when createProfile != null:
return createProfile(_that.profile,_that.imageFile);case UpdateProfile() when updateProfile != null:
return updateProfile(_that.profile,_that.imageFile);case LoadProfile() when loadProfile != null:
return loadProfile(_that.userId);case CheckProfileExists() when checkProfileExists != null:
return checkProfileExists(_that.userId);case _:
  return null;

}
}

}

/// @nodoc


class CreateProfile implements ProfileEvent {
  const CreateProfile(this.profile, this.imageFile);
  

 final  ProfileEntity profile;
 final  File? imageFile;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateProfileCopyWith<CreateProfile> get copyWith => _$CreateProfileCopyWithImpl<CreateProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateProfile&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.imageFile, imageFile) || other.imageFile == imageFile));
}


@override
int get hashCode => Object.hash(runtimeType,profile,imageFile);

@override
String toString() {
  return 'ProfileEvent.createProfile(profile: $profile, imageFile: $imageFile)';
}


}

/// @nodoc
abstract mixin class $CreateProfileCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory $CreateProfileCopyWith(CreateProfile value, $Res Function(CreateProfile) _then) = _$CreateProfileCopyWithImpl;
@useResult
$Res call({
 ProfileEntity profile, File? imageFile
});


$ProfileEntityCopyWith<$Res> get profile;

}
/// @nodoc
class _$CreateProfileCopyWithImpl<$Res>
    implements $CreateProfileCopyWith<$Res> {
  _$CreateProfileCopyWithImpl(this._self, this._then);

  final CreateProfile _self;
  final $Res Function(CreateProfile) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profile = null,Object? imageFile = freezed,}) {
  return _then(CreateProfile(
null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as ProfileEntity,freezed == imageFile ? _self.imageFile : imageFile // ignore: cast_nullable_to_non_nullable
as File?,
  ));
}

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileEntityCopyWith<$Res> get profile {
  
  return $ProfileEntityCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}

/// @nodoc


class UpdateProfile implements ProfileEvent {
  const UpdateProfile(this.profile, this.imageFile);
  

 final  ProfileEntity profile;
 final  File? imageFile;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProfileCopyWith<UpdateProfile> get copyWith => _$UpdateProfileCopyWithImpl<UpdateProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfile&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.imageFile, imageFile) || other.imageFile == imageFile));
}


@override
int get hashCode => Object.hash(runtimeType,profile,imageFile);

@override
String toString() {
  return 'ProfileEvent.updateProfile(profile: $profile, imageFile: $imageFile)';
}


}

/// @nodoc
abstract mixin class $UpdateProfileCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory $UpdateProfileCopyWith(UpdateProfile value, $Res Function(UpdateProfile) _then) = _$UpdateProfileCopyWithImpl;
@useResult
$Res call({
 ProfileEntity profile, File? imageFile
});


$ProfileEntityCopyWith<$Res> get profile;

}
/// @nodoc
class _$UpdateProfileCopyWithImpl<$Res>
    implements $UpdateProfileCopyWith<$Res> {
  _$UpdateProfileCopyWithImpl(this._self, this._then);

  final UpdateProfile _self;
  final $Res Function(UpdateProfile) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profile = null,Object? imageFile = freezed,}) {
  return _then(UpdateProfile(
null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as ProfileEntity,freezed == imageFile ? _self.imageFile : imageFile // ignore: cast_nullable_to_non_nullable
as File?,
  ));
}

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileEntityCopyWith<$Res> get profile {
  
  return $ProfileEntityCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}

/// @nodoc


class LoadProfile implements ProfileEvent {
  const LoadProfile(this.userId);
  

 final  String userId;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadProfileCopyWith<LoadProfile> get copyWith => _$LoadProfileCopyWithImpl<LoadProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadProfile&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'ProfileEvent.loadProfile(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $LoadProfileCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory $LoadProfileCopyWith(LoadProfile value, $Res Function(LoadProfile) _then) = _$LoadProfileCopyWithImpl;
@useResult
$Res call({
 String userId
});




}
/// @nodoc
class _$LoadProfileCopyWithImpl<$Res>
    implements $LoadProfileCopyWith<$Res> {
  _$LoadProfileCopyWithImpl(this._self, this._then);

  final LoadProfile _self;
  final $Res Function(LoadProfile) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(LoadProfile(
null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CheckProfileExists implements ProfileEvent {
  const CheckProfileExists(this.userId);
  

 final  String userId;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckProfileExistsCopyWith<CheckProfileExists> get copyWith => _$CheckProfileExistsCopyWithImpl<CheckProfileExists>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckProfileExists&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'ProfileEvent.checkProfileExists(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $CheckProfileExistsCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory $CheckProfileExistsCopyWith(CheckProfileExists value, $Res Function(CheckProfileExists) _then) = _$CheckProfileExistsCopyWithImpl;
@useResult
$Res call({
 String userId
});




}
/// @nodoc
class _$CheckProfileExistsCopyWithImpl<$Res>
    implements $CheckProfileExistsCopyWith<$Res> {
  _$CheckProfileExistsCopyWithImpl(this._self, this._then);

  final CheckProfileExists _self;
  final $Res Function(CheckProfileExists) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(CheckProfileExists(
null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ProfileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState()';
}


}

/// @nodoc
class $ProfileStateCopyWith<$Res>  {
$ProfileStateCopyWith(ProfileState _, $Res Function(ProfileState) __);
}


/// Adds pattern-matching-related methods to [ProfileState].
extension ProfileStatePatterns on ProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Loaded value)?  loaded,TResult Function( NotFound value)?  notFound,TResult Function( Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case NotFound() when notFound != null:
return notFound(_that);case Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Loaded value)  loaded,required TResult Function( NotFound value)  notFound,required TResult Function( Error value)  error,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case Loaded():
return loaded(_that);case NotFound():
return notFound(_that);case Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Loaded value)?  loaded,TResult? Function( NotFound value)?  notFound,TResult? Function( Error value)?  error,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case NotFound() when notFound != null:
return notFound(_that);case Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ProfileEntity profile)?  loaded,TResult Function()?  notFound,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.profile);case NotFound() when notFound != null:
return notFound();case Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ProfileEntity profile)  loaded,required TResult Function()  notFound,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading();case Loaded():
return loaded(_that.profile);case NotFound():
return notFound();case Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ProfileEntity profile)?  loaded,TResult? Function()?  notFound,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.profile);case NotFound() when notFound != null:
return notFound();case Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements ProfileState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.initial()';
}


}




/// @nodoc


class Loading implements ProfileState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.loading()';
}


}




/// @nodoc


class Loaded implements ProfileState {
  const Loaded(this.profile);
  

 final  ProfileEntity profile;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&(identical(other.profile, profile) || other.profile == profile));
}


@override
int get hashCode => Object.hash(runtimeType,profile);

@override
String toString() {
  return 'ProfileState.loaded(profile: $profile)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 ProfileEntity profile
});


$ProfileEntityCopyWith<$Res> get profile;

}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profile = null,}) {
  return _then(Loaded(
null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as ProfileEntity,
  ));
}

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileEntityCopyWith<$Res> get profile {
  
  return $ProfileEntityCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}

/// @nodoc


class NotFound implements ProfileState {
  const NotFound();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.notFound()';
}


}




/// @nodoc


class Error implements ProfileState {
  const Error(this.message);
  

 final  String message;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProfileState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
