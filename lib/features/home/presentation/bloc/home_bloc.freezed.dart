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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetTopTenMovies value)?  getTopTenMovies,TResult Function( _GetNowPlayingMovies value)?  getNowPlayingMovies,TResult Function( _GetTrendingTvShows value)?  getTrendingTvShows,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetTopTenMovies() when getTopTenMovies != null:
return getTopTenMovies(_that);case _GetNowPlayingMovies() when getNowPlayingMovies != null:
return getNowPlayingMovies(_that);case _GetTrendingTvShows() when getTrendingTvShows != null:
return getTrendingTvShows(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetTopTenMovies value)  getTopTenMovies,required TResult Function( _GetNowPlayingMovies value)  getNowPlayingMovies,required TResult Function( _GetTrendingTvShows value)  getTrendingTvShows,}){
final _that = this;
switch (_that) {
case _GetTopTenMovies():
return getTopTenMovies(_that);case _GetNowPlayingMovies():
return getNowPlayingMovies(_that);case _GetTrendingTvShows():
return getTrendingTvShows(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetTopTenMovies value)?  getTopTenMovies,TResult? Function( _GetNowPlayingMovies value)?  getNowPlayingMovies,TResult? Function( _GetTrendingTvShows value)?  getTrendingTvShows,}){
final _that = this;
switch (_that) {
case _GetTopTenMovies() when getTopTenMovies != null:
return getTopTenMovies(_that);case _GetNowPlayingMovies() when getNowPlayingMovies != null:
return getNowPlayingMovies(_that);case _GetTrendingTvShows() when getTrendingTvShows != null:
return getTrendingTvShows(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String language)?  getTopTenMovies,TResult Function( String language,  int page)?  getNowPlayingMovies,TResult Function( String language)?  getTrendingTvShows,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetTopTenMovies() when getTopTenMovies != null:
return getTopTenMovies(_that.language);case _GetNowPlayingMovies() when getNowPlayingMovies != null:
return getNowPlayingMovies(_that.language,_that.page);case _GetTrendingTvShows() when getTrendingTvShows != null:
return getTrendingTvShows(_that.language);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String language)  getTopTenMovies,required TResult Function( String language,  int page)  getNowPlayingMovies,required TResult Function( String language)  getTrendingTvShows,}) {final _that = this;
switch (_that) {
case _GetTopTenMovies():
return getTopTenMovies(_that.language);case _GetNowPlayingMovies():
return getNowPlayingMovies(_that.language,_that.page);case _GetTrendingTvShows():
return getTrendingTvShows(_that.language);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String language)?  getTopTenMovies,TResult? Function( String language,  int page)?  getNowPlayingMovies,TResult? Function( String language)?  getTrendingTvShows,}) {final _that = this;
switch (_that) {
case _GetTopTenMovies() when getTopTenMovies != null:
return getTopTenMovies(_that.language);case _GetNowPlayingMovies() when getNowPlayingMovies != null:
return getNowPlayingMovies(_that.language,_that.page);case _GetTrendingTvShows() when getTrendingTvShows != null:
return getTrendingTvShows(_that.language);case _:
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


class _GetNowPlayingMovies implements HomeEvent {
  const _GetNowPlayingMovies(this.language, this.page);
  

@override final  String language;
 final  int page;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetNowPlayingMoviesCopyWith<_GetNowPlayingMovies> get copyWith => __$GetNowPlayingMoviesCopyWithImpl<_GetNowPlayingMovies>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetNowPlayingMovies&&(identical(other.language, language) || other.language == language)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,language,page);

@override
String toString() {
  return 'HomeEvent.getNowPlayingMovies(language: $language, page: $page)';
}


}

/// @nodoc
abstract mixin class _$GetNowPlayingMoviesCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$GetNowPlayingMoviesCopyWith(_GetNowPlayingMovies value, $Res Function(_GetNowPlayingMovies) _then) = __$GetNowPlayingMoviesCopyWithImpl;
@override @useResult
$Res call({
 String language, int page
});




}
/// @nodoc
class __$GetNowPlayingMoviesCopyWithImpl<$Res>
    implements _$GetNowPlayingMoviesCopyWith<$Res> {
  __$GetNowPlayingMoviesCopyWithImpl(this._self, this._then);

  final _GetNowPlayingMovies _self;
  final $Res Function(_GetNowPlayingMovies) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? language = null,Object? page = null,}) {
  return _then(_GetNowPlayingMovies(
null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _GetTrendingTvShows implements HomeEvent {
  const _GetTrendingTvShows(this.language);
  

@override final  String language;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetTrendingTvShowsCopyWith<_GetTrendingTvShows> get copyWith => __$GetTrendingTvShowsCopyWithImpl<_GetTrendingTvShows>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetTrendingTvShows&&(identical(other.language, language) || other.language == language));
}


@override
int get hashCode => Object.hash(runtimeType,language);

@override
String toString() {
  return 'HomeEvent.getTrendingTvShows(language: $language)';
}


}

/// @nodoc
abstract mixin class _$GetTrendingTvShowsCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$GetTrendingTvShowsCopyWith(_GetTrendingTvShows value, $Res Function(_GetTrendingTvShows) _then) = __$GetTrendingTvShowsCopyWithImpl;
@override @useResult
$Res call({
 String language
});




}
/// @nodoc
class __$GetTrendingTvShowsCopyWithImpl<$Res>
    implements _$GetTrendingTvShowsCopyWith<$Res> {
  __$GetTrendingTvShowsCopyWithImpl(this._self, this._then);

  final _GetTrendingTvShows _self;
  final $Res Function(_GetTrendingTvShows) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? language = null,}) {
  return _then(_GetTrendingTvShows(
null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$HomeState {

 bool get isLoadingTopMovies; bool get isLoadingNowPlaying; bool get isLoadingTrendingTvShows; MoviesResponseEntity? get topMovies; List<NowPlayingMovieEntity>? get nowPlayingMovies; List<TrendingTvShowEntity>? get trendingTvShows; String? get errorMessage;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.isLoadingTopMovies, isLoadingTopMovies) || other.isLoadingTopMovies == isLoadingTopMovies)&&(identical(other.isLoadingNowPlaying, isLoadingNowPlaying) || other.isLoadingNowPlaying == isLoadingNowPlaying)&&(identical(other.isLoadingTrendingTvShows, isLoadingTrendingTvShows) || other.isLoadingTrendingTvShows == isLoadingTrendingTvShows)&&(identical(other.topMovies, topMovies) || other.topMovies == topMovies)&&const DeepCollectionEquality().equals(other.nowPlayingMovies, nowPlayingMovies)&&const DeepCollectionEquality().equals(other.trendingTvShows, trendingTvShows)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoadingTopMovies,isLoadingNowPlaying,isLoadingTrendingTvShows,topMovies,const DeepCollectionEquality().hash(nowPlayingMovies),const DeepCollectionEquality().hash(trendingTvShows),errorMessage);

@override
String toString() {
  return 'HomeState(isLoadingTopMovies: $isLoadingTopMovies, isLoadingNowPlaying: $isLoadingNowPlaying, isLoadingTrendingTvShows: $isLoadingTrendingTvShows, topMovies: $topMovies, nowPlayingMovies: $nowPlayingMovies, trendingTvShows: $trendingTvShows, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 bool isLoadingTopMovies, bool isLoadingNowPlaying, bool isLoadingTrendingTvShows, MoviesResponseEntity? topMovies, List<NowPlayingMovieEntity>? nowPlayingMovies, List<TrendingTvShowEntity>? trendingTvShows, String? errorMessage
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoadingTopMovies = null,Object? isLoadingNowPlaying = null,Object? isLoadingTrendingTvShows = null,Object? topMovies = freezed,Object? nowPlayingMovies = freezed,Object? trendingTvShows = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isLoadingTopMovies: null == isLoadingTopMovies ? _self.isLoadingTopMovies : isLoadingTopMovies // ignore: cast_nullable_to_non_nullable
as bool,isLoadingNowPlaying: null == isLoadingNowPlaying ? _self.isLoadingNowPlaying : isLoadingNowPlaying // ignore: cast_nullable_to_non_nullable
as bool,isLoadingTrendingTvShows: null == isLoadingTrendingTvShows ? _self.isLoadingTrendingTvShows : isLoadingTrendingTvShows // ignore: cast_nullable_to_non_nullable
as bool,topMovies: freezed == topMovies ? _self.topMovies : topMovies // ignore: cast_nullable_to_non_nullable
as MoviesResponseEntity?,nowPlayingMovies: freezed == nowPlayingMovies ? _self.nowPlayingMovies : nowPlayingMovies // ignore: cast_nullable_to_non_nullable
as List<NowPlayingMovieEntity>?,trendingTvShows: freezed == trendingTvShows ? _self.trendingTvShows : trendingTvShows // ignore: cast_nullable_to_non_nullable
as List<TrendingTvShowEntity>?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoadingTopMovies,  bool isLoadingNowPlaying,  bool isLoadingTrendingTvShows,  MoviesResponseEntity? topMovies,  List<NowPlayingMovieEntity>? nowPlayingMovies,  List<TrendingTvShowEntity>? trendingTvShows,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.isLoadingTopMovies,_that.isLoadingNowPlaying,_that.isLoadingTrendingTvShows,_that.topMovies,_that.nowPlayingMovies,_that.trendingTvShows,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoadingTopMovies,  bool isLoadingNowPlaying,  bool isLoadingTrendingTvShows,  MoviesResponseEntity? topMovies,  List<NowPlayingMovieEntity>? nowPlayingMovies,  List<TrendingTvShowEntity>? trendingTvShows,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.isLoadingTopMovies,_that.isLoadingNowPlaying,_that.isLoadingTrendingTvShows,_that.topMovies,_that.nowPlayingMovies,_that.trendingTvShows,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoadingTopMovies,  bool isLoadingNowPlaying,  bool isLoadingTrendingTvShows,  MoviesResponseEntity? topMovies,  List<NowPlayingMovieEntity>? nowPlayingMovies,  List<TrendingTvShowEntity>? trendingTvShows,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.isLoadingTopMovies,_that.isLoadingNowPlaying,_that.isLoadingTrendingTvShows,_that.topMovies,_that.nowPlayingMovies,_that.trendingTvShows,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({this.isLoadingTopMovies = false, this.isLoadingNowPlaying = false, this.isLoadingTrendingTvShows = false, this.topMovies, final  List<NowPlayingMovieEntity>? nowPlayingMovies, final  List<TrendingTvShowEntity>? trendingTvShows, this.errorMessage}): _nowPlayingMovies = nowPlayingMovies,_trendingTvShows = trendingTvShows;
  

@override@JsonKey() final  bool isLoadingTopMovies;
@override@JsonKey() final  bool isLoadingNowPlaying;
@override@JsonKey() final  bool isLoadingTrendingTvShows;
@override final  MoviesResponseEntity? topMovies;
 final  List<NowPlayingMovieEntity>? _nowPlayingMovies;
@override List<NowPlayingMovieEntity>? get nowPlayingMovies {
  final value = _nowPlayingMovies;
  if (value == null) return null;
  if (_nowPlayingMovies is EqualUnmodifiableListView) return _nowPlayingMovies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<TrendingTvShowEntity>? _trendingTvShows;
@override List<TrendingTvShowEntity>? get trendingTvShows {
  final value = _trendingTvShows;
  if (value == null) return null;
  if (_trendingTvShows is EqualUnmodifiableListView) return _trendingTvShows;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? errorMessage;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.isLoadingTopMovies, isLoadingTopMovies) || other.isLoadingTopMovies == isLoadingTopMovies)&&(identical(other.isLoadingNowPlaying, isLoadingNowPlaying) || other.isLoadingNowPlaying == isLoadingNowPlaying)&&(identical(other.isLoadingTrendingTvShows, isLoadingTrendingTvShows) || other.isLoadingTrendingTvShows == isLoadingTrendingTvShows)&&(identical(other.topMovies, topMovies) || other.topMovies == topMovies)&&const DeepCollectionEquality().equals(other._nowPlayingMovies, _nowPlayingMovies)&&const DeepCollectionEquality().equals(other._trendingTvShows, _trendingTvShows)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoadingTopMovies,isLoadingNowPlaying,isLoadingTrendingTvShows,topMovies,const DeepCollectionEquality().hash(_nowPlayingMovies),const DeepCollectionEquality().hash(_trendingTvShows),errorMessage);

@override
String toString() {
  return 'HomeState(isLoadingTopMovies: $isLoadingTopMovies, isLoadingNowPlaying: $isLoadingNowPlaying, isLoadingTrendingTvShows: $isLoadingTrendingTvShows, topMovies: $topMovies, nowPlayingMovies: $nowPlayingMovies, trendingTvShows: $trendingTvShows, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoadingTopMovies, bool isLoadingNowPlaying, bool isLoadingTrendingTvShows, MoviesResponseEntity? topMovies, List<NowPlayingMovieEntity>? nowPlayingMovies, List<TrendingTvShowEntity>? trendingTvShows, String? errorMessage
});




}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoadingTopMovies = null,Object? isLoadingNowPlaying = null,Object? isLoadingTrendingTvShows = null,Object? topMovies = freezed,Object? nowPlayingMovies = freezed,Object? trendingTvShows = freezed,Object? errorMessage = freezed,}) {
  return _then(_HomeState(
isLoadingTopMovies: null == isLoadingTopMovies ? _self.isLoadingTopMovies : isLoadingTopMovies // ignore: cast_nullable_to_non_nullable
as bool,isLoadingNowPlaying: null == isLoadingNowPlaying ? _self.isLoadingNowPlaying : isLoadingNowPlaying // ignore: cast_nullable_to_non_nullable
as bool,isLoadingTrendingTvShows: null == isLoadingTrendingTvShows ? _self.isLoadingTrendingTvShows : isLoadingTrendingTvShows // ignore: cast_nullable_to_non_nullable
as bool,topMovies: freezed == topMovies ? _self.topMovies : topMovies // ignore: cast_nullable_to_non_nullable
as MoviesResponseEntity?,nowPlayingMovies: freezed == nowPlayingMovies ? _self._nowPlayingMovies : nowPlayingMovies // ignore: cast_nullable_to_non_nullable
as List<NowPlayingMovieEntity>?,trendingTvShows: freezed == trendingTvShows ? _self._trendingTvShows : trendingTvShows // ignore: cast_nullable_to_non_nullable
as List<TrendingTvShowEntity>?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
