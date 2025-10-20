// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeEvent {

 String get language;
/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeEventCopyWith<HomeEvent> get copyWith => _$HomeEventCopyWithImpl<HomeEvent>(this as HomeEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEvent&&(identical(other.language, language) || other.language == language));
}


@override
int get hashCode => Object.hash(runtimeType,language);

@override
String toString() {
  return 'HomeEvent(language: $language)';
}


}

/// @nodoc
abstract mixin class $HomeEventCopyWith<$Res>  {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) _then) = _$HomeEventCopyWithImpl;
@useResult
$Res call({
 String language
});




}
/// @nodoc
class _$HomeEventCopyWithImpl<$Res>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._self, this._then);

  final HomeEvent _self;
  final $Res Function(HomeEvent) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? language = null,}) {
  return _then(_self.copyWith(
language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeEvent].
extension HomeEventPatterns on HomeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetTopTenMovies value)?  getTopTenMovies,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetTopTenMovies() when getTopTenMovies != null:
return getTopTenMovies(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetTopTenMovies value)  getTopTenMovies,}){
final _that = this;
switch (_that) {
case _GetTopTenMovies():
return getTopTenMovies(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetTopTenMovies value)?  getTopTenMovies,}){
final _that = this;
switch (_that) {
case _GetTopTenMovies() when getTopTenMovies != null:
return getTopTenMovies(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String language)?  getTopTenMovies,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetTopTenMovies() when getTopTenMovies != null:
return getTopTenMovies(_that.language);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String language)  getTopTenMovies,}) {final _that = this;
switch (_that) {
case _GetTopTenMovies():
return getTopTenMovies(_that.language);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String language)?  getTopTenMovies,}) {final _that = this;
switch (_that) {
case _GetTopTenMovies() when getTopTenMovies != null:
return getTopTenMovies(_that.language);case _:
  return null;

}
}

}

/// @nodoc


class _GetTopTenMovies implements HomeEvent {
  const _GetTopTenMovies(this.language);
  

@override final  String language;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetTopTenMoviesCopyWith<_GetTopTenMovies> get copyWith => __$GetTopTenMoviesCopyWithImpl<_GetTopTenMovies>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetTopTenMovies&&(identical(other.language, language) || other.language == language));
}


@override
int get hashCode => Object.hash(runtimeType,language);

@override
String toString() {
  return 'HomeEvent.getTopTenMovies(language: $language)';
}


}

/// @nodoc
abstract mixin class _$GetTopTenMoviesCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$GetTopTenMoviesCopyWith(_GetTopTenMovies value, $Res Function(_GetTopTenMovies) _then) = __$GetTopTenMoviesCopyWithImpl;
@override @useResult
$Res call({
 String language
});




}
/// @nodoc
class __$GetTopTenMoviesCopyWithImpl<$Res>
    implements _$GetTopTenMoviesCopyWith<$Res> {
  __$GetTopTenMoviesCopyWithImpl(this._self, this._then);

  final _GetTopTenMovies _self;
  final $Res Function(_GetTopTenMovies) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? language = null,}) {
  return _then(_GetTopTenMovies(
null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$HomeState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState()';
}


}

/// @nodoc
class $HomeStateCopyWith<$Res>  {
$HomeStateCopyWith(HomeState _, $Res Function(HomeState) __);
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _TopMoviesLoading value)?  topMoviesLoading,TResult Function( _TopMoviesLoaded value)?  topMoviesLoaded,TResult Function( _TopMoviesError value)?  topMoviesError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _TopMoviesLoading() when topMoviesLoading != null:
return topMoviesLoading(_that);case _TopMoviesLoaded() when topMoviesLoaded != null:
return topMoviesLoaded(_that);case _TopMoviesError() when topMoviesError != null:
return topMoviesError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _TopMoviesLoading value)  topMoviesLoading,required TResult Function( _TopMoviesLoaded value)  topMoviesLoaded,required TResult Function( _TopMoviesError value)  topMoviesError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _TopMoviesLoading():
return topMoviesLoading(_that);case _TopMoviesLoaded():
return topMoviesLoaded(_that);case _TopMoviesError():
return topMoviesError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _TopMoviesLoading value)?  topMoviesLoading,TResult? Function( _TopMoviesLoaded value)?  topMoviesLoaded,TResult? Function( _TopMoviesError value)?  topMoviesError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _TopMoviesLoading() when topMoviesLoading != null:
return topMoviesLoading(_that);case _TopMoviesLoaded() when topMoviesLoaded != null:
return topMoviesLoaded(_that);case _TopMoviesError() when topMoviesError != null:
return topMoviesError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  topMoviesLoading,TResult Function( MoviesResponseEntity movies)?  topMoviesLoaded,TResult Function( String message)?  topMoviesError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _TopMoviesLoading() when topMoviesLoading != null:
return topMoviesLoading();case _TopMoviesLoaded() when topMoviesLoaded != null:
return topMoviesLoaded(_that.movies);case _TopMoviesError() when topMoviesError != null:
return topMoviesError(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  topMoviesLoading,required TResult Function( MoviesResponseEntity movies)  topMoviesLoaded,required TResult Function( String message)  topMoviesError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _TopMoviesLoading():
return topMoviesLoading();case _TopMoviesLoaded():
return topMoviesLoaded(_that.movies);case _TopMoviesError():
return topMoviesError(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  topMoviesLoading,TResult? Function( MoviesResponseEntity movies)?  topMoviesLoaded,TResult? Function( String message)?  topMoviesError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _TopMoviesLoading() when topMoviesLoading != null:
return topMoviesLoading();case _TopMoviesLoaded() when topMoviesLoaded != null:
return topMoviesLoaded(_that.movies);case _TopMoviesError() when topMoviesError != null:
return topMoviesError(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements HomeState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.initial()';
}


}




/// @nodoc


class _TopMoviesLoading implements HomeState {
  const _TopMoviesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopMoviesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.topMoviesLoading()';
}


}




/// @nodoc


class _TopMoviesLoaded implements HomeState {
  const _TopMoviesLoaded(this.movies);
  

 final  MoviesResponseEntity movies;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopMoviesLoadedCopyWith<_TopMoviesLoaded> get copyWith => __$TopMoviesLoadedCopyWithImpl<_TopMoviesLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopMoviesLoaded&&(identical(other.movies, movies) || other.movies == movies));
}


@override
int get hashCode => Object.hash(runtimeType,movies);

@override
String toString() {
  return 'HomeState.topMoviesLoaded(movies: $movies)';
}


}

/// @nodoc
abstract mixin class _$TopMoviesLoadedCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$TopMoviesLoadedCopyWith(_TopMoviesLoaded value, $Res Function(_TopMoviesLoaded) _then) = __$TopMoviesLoadedCopyWithImpl;
@useResult
$Res call({
 MoviesResponseEntity movies
});




}
/// @nodoc
class __$TopMoviesLoadedCopyWithImpl<$Res>
    implements _$TopMoviesLoadedCopyWith<$Res> {
  __$TopMoviesLoadedCopyWithImpl(this._self, this._then);

  final _TopMoviesLoaded _self;
  final $Res Function(_TopMoviesLoaded) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movies = null,}) {
  return _then(_TopMoviesLoaded(
null == movies ? _self.movies : movies // ignore: cast_nullable_to_non_nullable
as MoviesResponseEntity,
  ));
}


}

/// @nodoc


class _TopMoviesError implements HomeState {
  const _TopMoviesError(this.message);
  

 final  String message;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopMoviesErrorCopyWith<_TopMoviesError> get copyWith => __$TopMoviesErrorCopyWithImpl<_TopMoviesError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopMoviesError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'HomeState.topMoviesError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$TopMoviesErrorCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$TopMoviesErrorCopyWith(_TopMoviesError value, $Res Function(_TopMoviesError) _then) = __$TopMoviesErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$TopMoviesErrorCopyWithImpl<$Res>
    implements _$TopMoviesErrorCopyWith<$Res> {
  __$TopMoviesErrorCopyWithImpl(this._self, this._then);

  final _TopMoviesError _self;
  final $Res Function(_TopMoviesError) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_TopMoviesError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
