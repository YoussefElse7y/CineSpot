// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explore_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExploreState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExploreState()';
}


}

/// @nodoc
class $ExploreStateCopyWith<$Res>  {
$ExploreStateCopyWith(ExploreState _, $Res Function(ExploreState) __);
}


/// Adds pattern-matching-related methods to [ExploreState].
extension ExploreStatePatterns on ExploreState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ExploreInitial value)?  initial,TResult Function( ExploreLoading value)?  loading,TResult Function( MultiSearchLoaded value)?  multiSearchLoaded,TResult Function( MovieSearchLoaded value)?  movieSearchLoaded,TResult Function( TvShowSearchLoaded value)?  tvShowSearchLoaded,TResult Function( PersonSearchLoaded value)?  personSearchLoaded,TResult Function( CompanySearchLoaded value)?  companySearchLoaded,TResult Function( ExploreError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ExploreInitial() when initial != null:
return initial(_that);case ExploreLoading() when loading != null:
return loading(_that);case MultiSearchLoaded() when multiSearchLoaded != null:
return multiSearchLoaded(_that);case MovieSearchLoaded() when movieSearchLoaded != null:
return movieSearchLoaded(_that);case TvShowSearchLoaded() when tvShowSearchLoaded != null:
return tvShowSearchLoaded(_that);case PersonSearchLoaded() when personSearchLoaded != null:
return personSearchLoaded(_that);case CompanySearchLoaded() when companySearchLoaded != null:
return companySearchLoaded(_that);case ExploreError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ExploreInitial value)  initial,required TResult Function( ExploreLoading value)  loading,required TResult Function( MultiSearchLoaded value)  multiSearchLoaded,required TResult Function( MovieSearchLoaded value)  movieSearchLoaded,required TResult Function( TvShowSearchLoaded value)  tvShowSearchLoaded,required TResult Function( PersonSearchLoaded value)  personSearchLoaded,required TResult Function( CompanySearchLoaded value)  companySearchLoaded,required TResult Function( ExploreError value)  error,}){
final _that = this;
switch (_that) {
case ExploreInitial():
return initial(_that);case ExploreLoading():
return loading(_that);case MultiSearchLoaded():
return multiSearchLoaded(_that);case MovieSearchLoaded():
return movieSearchLoaded(_that);case TvShowSearchLoaded():
return tvShowSearchLoaded(_that);case PersonSearchLoaded():
return personSearchLoaded(_that);case CompanySearchLoaded():
return companySearchLoaded(_that);case ExploreError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ExploreInitial value)?  initial,TResult? Function( ExploreLoading value)?  loading,TResult? Function( MultiSearchLoaded value)?  multiSearchLoaded,TResult? Function( MovieSearchLoaded value)?  movieSearchLoaded,TResult? Function( TvShowSearchLoaded value)?  tvShowSearchLoaded,TResult? Function( PersonSearchLoaded value)?  personSearchLoaded,TResult? Function( CompanySearchLoaded value)?  companySearchLoaded,TResult? Function( ExploreError value)?  error,}){
final _that = this;
switch (_that) {
case ExploreInitial() when initial != null:
return initial(_that);case ExploreLoading() when loading != null:
return loading(_that);case MultiSearchLoaded() when multiSearchLoaded != null:
return multiSearchLoaded(_that);case MovieSearchLoaded() when movieSearchLoaded != null:
return movieSearchLoaded(_that);case TvShowSearchLoaded() when tvShowSearchLoaded != null:
return tvShowSearchLoaded(_that);case PersonSearchLoaded() when personSearchLoaded != null:
return personSearchLoaded(_that);case CompanySearchLoaded() when companySearchLoaded != null:
return companySearchLoaded(_that);case ExploreError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( SearchResponseEntity searchResponse)?  multiSearchLoaded,TResult Function( MovieSearchResponseEntity movieSearchResponse)?  movieSearchLoaded,TResult Function( TvSearchResponseEntity tvSearchResponse)?  tvShowSearchLoaded,TResult Function( PersonSearchResponseEntity personSearchResponse)?  personSearchLoaded,TResult Function( CompanySearchResponseEntity companySearchResponse)?  companySearchLoaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ExploreInitial() when initial != null:
return initial();case ExploreLoading() when loading != null:
return loading();case MultiSearchLoaded() when multiSearchLoaded != null:
return multiSearchLoaded(_that.searchResponse);case MovieSearchLoaded() when movieSearchLoaded != null:
return movieSearchLoaded(_that.movieSearchResponse);case TvShowSearchLoaded() when tvShowSearchLoaded != null:
return tvShowSearchLoaded(_that.tvSearchResponse);case PersonSearchLoaded() when personSearchLoaded != null:
return personSearchLoaded(_that.personSearchResponse);case CompanySearchLoaded() when companySearchLoaded != null:
return companySearchLoaded(_that.companySearchResponse);case ExploreError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( SearchResponseEntity searchResponse)  multiSearchLoaded,required TResult Function( MovieSearchResponseEntity movieSearchResponse)  movieSearchLoaded,required TResult Function( TvSearchResponseEntity tvSearchResponse)  tvShowSearchLoaded,required TResult Function( PersonSearchResponseEntity personSearchResponse)  personSearchLoaded,required TResult Function( CompanySearchResponseEntity companySearchResponse)  companySearchLoaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case ExploreInitial():
return initial();case ExploreLoading():
return loading();case MultiSearchLoaded():
return multiSearchLoaded(_that.searchResponse);case MovieSearchLoaded():
return movieSearchLoaded(_that.movieSearchResponse);case TvShowSearchLoaded():
return tvShowSearchLoaded(_that.tvSearchResponse);case PersonSearchLoaded():
return personSearchLoaded(_that.personSearchResponse);case CompanySearchLoaded():
return companySearchLoaded(_that.companySearchResponse);case ExploreError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( SearchResponseEntity searchResponse)?  multiSearchLoaded,TResult? Function( MovieSearchResponseEntity movieSearchResponse)?  movieSearchLoaded,TResult? Function( TvSearchResponseEntity tvSearchResponse)?  tvShowSearchLoaded,TResult? Function( PersonSearchResponseEntity personSearchResponse)?  personSearchLoaded,TResult? Function( CompanySearchResponseEntity companySearchResponse)?  companySearchLoaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case ExploreInitial() when initial != null:
return initial();case ExploreLoading() when loading != null:
return loading();case MultiSearchLoaded() when multiSearchLoaded != null:
return multiSearchLoaded(_that.searchResponse);case MovieSearchLoaded() when movieSearchLoaded != null:
return movieSearchLoaded(_that.movieSearchResponse);case TvShowSearchLoaded() when tvShowSearchLoaded != null:
return tvShowSearchLoaded(_that.tvSearchResponse);case PersonSearchLoaded() when personSearchLoaded != null:
return personSearchLoaded(_that.personSearchResponse);case CompanySearchLoaded() when companySearchLoaded != null:
return companySearchLoaded(_that.companySearchResponse);case ExploreError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ExploreInitial implements ExploreState {
  const ExploreInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExploreState.initial()';
}


}




/// @nodoc


class ExploreLoading implements ExploreState {
  const ExploreLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExploreState.loading()';
}


}




/// @nodoc


class MultiSearchLoaded implements ExploreState {
  const MultiSearchLoaded({required this.searchResponse});
  

 final  SearchResponseEntity searchResponse;

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MultiSearchLoadedCopyWith<MultiSearchLoaded> get copyWith => _$MultiSearchLoadedCopyWithImpl<MultiSearchLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MultiSearchLoaded&&(identical(other.searchResponse, searchResponse) || other.searchResponse == searchResponse));
}


@override
int get hashCode => Object.hash(runtimeType,searchResponse);

@override
String toString() {
  return 'ExploreState.multiSearchLoaded(searchResponse: $searchResponse)';
}


}

/// @nodoc
abstract mixin class $MultiSearchLoadedCopyWith<$Res> implements $ExploreStateCopyWith<$Res> {
  factory $MultiSearchLoadedCopyWith(MultiSearchLoaded value, $Res Function(MultiSearchLoaded) _then) = _$MultiSearchLoadedCopyWithImpl;
@useResult
$Res call({
 SearchResponseEntity searchResponse
});




}
/// @nodoc
class _$MultiSearchLoadedCopyWithImpl<$Res>
    implements $MultiSearchLoadedCopyWith<$Res> {
  _$MultiSearchLoadedCopyWithImpl(this._self, this._then);

  final MultiSearchLoaded _self;
  final $Res Function(MultiSearchLoaded) _then;

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? searchResponse = null,}) {
  return _then(MultiSearchLoaded(
searchResponse: null == searchResponse ? _self.searchResponse : searchResponse // ignore: cast_nullable_to_non_nullable
as SearchResponseEntity,
  ));
}


}

/// @nodoc


class MovieSearchLoaded implements ExploreState {
  const MovieSearchLoaded({required this.movieSearchResponse});
  

 final  MovieSearchResponseEntity movieSearchResponse;

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieSearchLoadedCopyWith<MovieSearchLoaded> get copyWith => _$MovieSearchLoadedCopyWithImpl<MovieSearchLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieSearchLoaded&&(identical(other.movieSearchResponse, movieSearchResponse) || other.movieSearchResponse == movieSearchResponse));
}


@override
int get hashCode => Object.hash(runtimeType,movieSearchResponse);

@override
String toString() {
  return 'ExploreState.movieSearchLoaded(movieSearchResponse: $movieSearchResponse)';
}


}

/// @nodoc
abstract mixin class $MovieSearchLoadedCopyWith<$Res> implements $ExploreStateCopyWith<$Res> {
  factory $MovieSearchLoadedCopyWith(MovieSearchLoaded value, $Res Function(MovieSearchLoaded) _then) = _$MovieSearchLoadedCopyWithImpl;
@useResult
$Res call({
 MovieSearchResponseEntity movieSearchResponse
});




}
/// @nodoc
class _$MovieSearchLoadedCopyWithImpl<$Res>
    implements $MovieSearchLoadedCopyWith<$Res> {
  _$MovieSearchLoadedCopyWithImpl(this._self, this._then);

  final MovieSearchLoaded _self;
  final $Res Function(MovieSearchLoaded) _then;

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movieSearchResponse = null,}) {
  return _then(MovieSearchLoaded(
movieSearchResponse: null == movieSearchResponse ? _self.movieSearchResponse : movieSearchResponse // ignore: cast_nullable_to_non_nullable
as MovieSearchResponseEntity,
  ));
}


}

/// @nodoc


class TvShowSearchLoaded implements ExploreState {
  const TvShowSearchLoaded({required this.tvSearchResponse});
  

 final  TvSearchResponseEntity tvSearchResponse;

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TvShowSearchLoadedCopyWith<TvShowSearchLoaded> get copyWith => _$TvShowSearchLoadedCopyWithImpl<TvShowSearchLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TvShowSearchLoaded&&(identical(other.tvSearchResponse, tvSearchResponse) || other.tvSearchResponse == tvSearchResponse));
}


@override
int get hashCode => Object.hash(runtimeType,tvSearchResponse);

@override
String toString() {
  return 'ExploreState.tvShowSearchLoaded(tvSearchResponse: $tvSearchResponse)';
}


}

/// @nodoc
abstract mixin class $TvShowSearchLoadedCopyWith<$Res> implements $ExploreStateCopyWith<$Res> {
  factory $TvShowSearchLoadedCopyWith(TvShowSearchLoaded value, $Res Function(TvShowSearchLoaded) _then) = _$TvShowSearchLoadedCopyWithImpl;
@useResult
$Res call({
 TvSearchResponseEntity tvSearchResponse
});




}
/// @nodoc
class _$TvShowSearchLoadedCopyWithImpl<$Res>
    implements $TvShowSearchLoadedCopyWith<$Res> {
  _$TvShowSearchLoadedCopyWithImpl(this._self, this._then);

  final TvShowSearchLoaded _self;
  final $Res Function(TvShowSearchLoaded) _then;

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tvSearchResponse = null,}) {
  return _then(TvShowSearchLoaded(
tvSearchResponse: null == tvSearchResponse ? _self.tvSearchResponse : tvSearchResponse // ignore: cast_nullable_to_non_nullable
as TvSearchResponseEntity,
  ));
}


}

/// @nodoc


class PersonSearchLoaded implements ExploreState {
  const PersonSearchLoaded({required this.personSearchResponse});
  

 final  PersonSearchResponseEntity personSearchResponse;

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonSearchLoadedCopyWith<PersonSearchLoaded> get copyWith => _$PersonSearchLoadedCopyWithImpl<PersonSearchLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonSearchLoaded&&(identical(other.personSearchResponse, personSearchResponse) || other.personSearchResponse == personSearchResponse));
}


@override
int get hashCode => Object.hash(runtimeType,personSearchResponse);

@override
String toString() {
  return 'ExploreState.personSearchLoaded(personSearchResponse: $personSearchResponse)';
}


}

/// @nodoc
abstract mixin class $PersonSearchLoadedCopyWith<$Res> implements $ExploreStateCopyWith<$Res> {
  factory $PersonSearchLoadedCopyWith(PersonSearchLoaded value, $Res Function(PersonSearchLoaded) _then) = _$PersonSearchLoadedCopyWithImpl;
@useResult
$Res call({
 PersonSearchResponseEntity personSearchResponse
});




}
/// @nodoc
class _$PersonSearchLoadedCopyWithImpl<$Res>
    implements $PersonSearchLoadedCopyWith<$Res> {
  _$PersonSearchLoadedCopyWithImpl(this._self, this._then);

  final PersonSearchLoaded _self;
  final $Res Function(PersonSearchLoaded) _then;

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? personSearchResponse = null,}) {
  return _then(PersonSearchLoaded(
personSearchResponse: null == personSearchResponse ? _self.personSearchResponse : personSearchResponse // ignore: cast_nullable_to_non_nullable
as PersonSearchResponseEntity,
  ));
}


}

/// @nodoc


class CompanySearchLoaded implements ExploreState {
  const CompanySearchLoaded({required this.companySearchResponse});
  

 final  CompanySearchResponseEntity companySearchResponse;

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanySearchLoadedCopyWith<CompanySearchLoaded> get copyWith => _$CompanySearchLoadedCopyWithImpl<CompanySearchLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanySearchLoaded&&(identical(other.companySearchResponse, companySearchResponse) || other.companySearchResponse == companySearchResponse));
}


@override
int get hashCode => Object.hash(runtimeType,companySearchResponse);

@override
String toString() {
  return 'ExploreState.companySearchLoaded(companySearchResponse: $companySearchResponse)';
}


}

/// @nodoc
abstract mixin class $CompanySearchLoadedCopyWith<$Res> implements $ExploreStateCopyWith<$Res> {
  factory $CompanySearchLoadedCopyWith(CompanySearchLoaded value, $Res Function(CompanySearchLoaded) _then) = _$CompanySearchLoadedCopyWithImpl;
@useResult
$Res call({
 CompanySearchResponseEntity companySearchResponse
});




}
/// @nodoc
class _$CompanySearchLoadedCopyWithImpl<$Res>
    implements $CompanySearchLoadedCopyWith<$Res> {
  _$CompanySearchLoadedCopyWithImpl(this._self, this._then);

  final CompanySearchLoaded _self;
  final $Res Function(CompanySearchLoaded) _then;

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? companySearchResponse = null,}) {
  return _then(CompanySearchLoaded(
companySearchResponse: null == companySearchResponse ? _self.companySearchResponse : companySearchResponse // ignore: cast_nullable_to_non_nullable
as CompanySearchResponseEntity,
  ));
}


}

/// @nodoc


class ExploreError implements ExploreState {
  const ExploreError({required this.message});
  

 final  String message;

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExploreErrorCopyWith<ExploreError> get copyWith => _$ExploreErrorCopyWithImpl<ExploreError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ExploreState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ExploreErrorCopyWith<$Res> implements $ExploreStateCopyWith<$Res> {
  factory $ExploreErrorCopyWith(ExploreError value, $Res Function(ExploreError) _then) = _$ExploreErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ExploreErrorCopyWithImpl<$Res>
    implements $ExploreErrorCopyWith<$Res> {
  _$ExploreErrorCopyWithImpl(this._self, this._then);

  final ExploreError _self;
  final $Res Function(ExploreError) _then;

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ExploreError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
