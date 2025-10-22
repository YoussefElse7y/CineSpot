// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explore_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExploreEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExploreEvent()';
}


}

/// @nodoc
class $ExploreEventCopyWith<$Res>  {
$ExploreEventCopyWith(ExploreEvent _, $Res Function(ExploreEvent) __);
}


/// Adds pattern-matching-related methods to [ExploreEvent].
extension ExploreEventPatterns on ExploreEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SearchMultiEvent value)?  searchMulti,TResult Function( TrendingEvent value)?  trending,TResult Function( SearchMoviesEvent value)?  searchMovies,TResult Function( SearchTvShowsEvent value)?  searchTvShows,TResult Function( SearchPersonEvent value)?  searchPerson,TResult Function( SearchCompanyEvent value)?  searchCompany,TResult Function( ClearSearchEvent value)?  clearSearch,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SearchMultiEvent() when searchMulti != null:
return searchMulti(_that);case TrendingEvent() when trending != null:
return trending(_that);case SearchMoviesEvent() when searchMovies != null:
return searchMovies(_that);case SearchTvShowsEvent() when searchTvShows != null:
return searchTvShows(_that);case SearchPersonEvent() when searchPerson != null:
return searchPerson(_that);case SearchCompanyEvent() when searchCompany != null:
return searchCompany(_that);case ClearSearchEvent() when clearSearch != null:
return clearSearch(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SearchMultiEvent value)  searchMulti,required TResult Function( TrendingEvent value)  trending,required TResult Function( SearchMoviesEvent value)  searchMovies,required TResult Function( SearchTvShowsEvent value)  searchTvShows,required TResult Function( SearchPersonEvent value)  searchPerson,required TResult Function( SearchCompanyEvent value)  searchCompany,required TResult Function( ClearSearchEvent value)  clearSearch,}){
final _that = this;
switch (_that) {
case SearchMultiEvent():
return searchMulti(_that);case TrendingEvent():
return trending(_that);case SearchMoviesEvent():
return searchMovies(_that);case SearchTvShowsEvent():
return searchTvShows(_that);case SearchPersonEvent():
return searchPerson(_that);case SearchCompanyEvent():
return searchCompany(_that);case ClearSearchEvent():
return clearSearch(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SearchMultiEvent value)?  searchMulti,TResult? Function( TrendingEvent value)?  trending,TResult? Function( SearchMoviesEvent value)?  searchMovies,TResult? Function( SearchTvShowsEvent value)?  searchTvShows,TResult? Function( SearchPersonEvent value)?  searchPerson,TResult? Function( SearchCompanyEvent value)?  searchCompany,TResult? Function( ClearSearchEvent value)?  clearSearch,}){
final _that = this;
switch (_that) {
case SearchMultiEvent() when searchMulti != null:
return searchMulti(_that);case TrendingEvent() when trending != null:
return trending(_that);case SearchMoviesEvent() when searchMovies != null:
return searchMovies(_that);case SearchTvShowsEvent() when searchTvShows != null:
return searchTvShows(_that);case SearchPersonEvent() when searchPerson != null:
return searchPerson(_that);case SearchCompanyEvent() when searchCompany != null:
return searchCompany(_that);case ClearSearchEvent() when clearSearch != null:
return clearSearch(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String query,  String? language,  int? page)?  searchMulti,TResult Function( String? language)?  trending,TResult Function( String query,  String? language,  int? page,  String? primaryReleaseYear,  String? region,  String? year)?  searchMovies,TResult Function( String query,  String? language,  int? page,  String? firstAirDateYear,  int? year)?  searchTvShows,TResult Function( String query,  String? language,  int? page)?  searchPerson,TResult Function( String query,  int? page)?  searchCompany,TResult Function()?  clearSearch,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SearchMultiEvent() when searchMulti != null:
return searchMulti(_that.query,_that.language,_that.page);case TrendingEvent() when trending != null:
return trending(_that.language);case SearchMoviesEvent() when searchMovies != null:
return searchMovies(_that.query,_that.language,_that.page,_that.primaryReleaseYear,_that.region,_that.year);case SearchTvShowsEvent() when searchTvShows != null:
return searchTvShows(_that.query,_that.language,_that.page,_that.firstAirDateYear,_that.year);case SearchPersonEvent() when searchPerson != null:
return searchPerson(_that.query,_that.language,_that.page);case SearchCompanyEvent() when searchCompany != null:
return searchCompany(_that.query,_that.page);case ClearSearchEvent() when clearSearch != null:
return clearSearch();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String query,  String? language,  int? page)  searchMulti,required TResult Function( String? language)  trending,required TResult Function( String query,  String? language,  int? page,  String? primaryReleaseYear,  String? region,  String? year)  searchMovies,required TResult Function( String query,  String? language,  int? page,  String? firstAirDateYear,  int? year)  searchTvShows,required TResult Function( String query,  String? language,  int? page)  searchPerson,required TResult Function( String query,  int? page)  searchCompany,required TResult Function()  clearSearch,}) {final _that = this;
switch (_that) {
case SearchMultiEvent():
return searchMulti(_that.query,_that.language,_that.page);case TrendingEvent():
return trending(_that.language);case SearchMoviesEvent():
return searchMovies(_that.query,_that.language,_that.page,_that.primaryReleaseYear,_that.region,_that.year);case SearchTvShowsEvent():
return searchTvShows(_that.query,_that.language,_that.page,_that.firstAirDateYear,_that.year);case SearchPersonEvent():
return searchPerson(_that.query,_that.language,_that.page);case SearchCompanyEvent():
return searchCompany(_that.query,_that.page);case ClearSearchEvent():
return clearSearch();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String query,  String? language,  int? page)?  searchMulti,TResult? Function( String? language)?  trending,TResult? Function( String query,  String? language,  int? page,  String? primaryReleaseYear,  String? region,  String? year)?  searchMovies,TResult? Function( String query,  String? language,  int? page,  String? firstAirDateYear,  int? year)?  searchTvShows,TResult? Function( String query,  String? language,  int? page)?  searchPerson,TResult? Function( String query,  int? page)?  searchCompany,TResult? Function()?  clearSearch,}) {final _that = this;
switch (_that) {
case SearchMultiEvent() when searchMulti != null:
return searchMulti(_that.query,_that.language,_that.page);case TrendingEvent() when trending != null:
return trending(_that.language);case SearchMoviesEvent() when searchMovies != null:
return searchMovies(_that.query,_that.language,_that.page,_that.primaryReleaseYear,_that.region,_that.year);case SearchTvShowsEvent() when searchTvShows != null:
return searchTvShows(_that.query,_that.language,_that.page,_that.firstAirDateYear,_that.year);case SearchPersonEvent() when searchPerson != null:
return searchPerson(_that.query,_that.language,_that.page);case SearchCompanyEvent() when searchCompany != null:
return searchCompany(_that.query,_that.page);case ClearSearchEvent() when clearSearch != null:
return clearSearch();case _:
  return null;

}
}

}

/// @nodoc


class SearchMultiEvent implements ExploreEvent {
  const SearchMultiEvent({required this.query, this.language, this.page});
  

 final  String query;
 final  String? language;
 final  int? page;

/// Create a copy of ExploreEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchMultiEventCopyWith<SearchMultiEvent> get copyWith => _$SearchMultiEventCopyWithImpl<SearchMultiEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchMultiEvent&&(identical(other.query, query) || other.query == query)&&(identical(other.language, language) || other.language == language)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,query,language,page);

@override
String toString() {
  return 'ExploreEvent.searchMulti(query: $query, language: $language, page: $page)';
}


}

/// @nodoc
abstract mixin class $SearchMultiEventCopyWith<$Res> implements $ExploreEventCopyWith<$Res> {
  factory $SearchMultiEventCopyWith(SearchMultiEvent value, $Res Function(SearchMultiEvent) _then) = _$SearchMultiEventCopyWithImpl;
@useResult
$Res call({
 String query, String? language, int? page
});




}
/// @nodoc
class _$SearchMultiEventCopyWithImpl<$Res>
    implements $SearchMultiEventCopyWith<$Res> {
  _$SearchMultiEventCopyWithImpl(this._self, this._then);

  final SearchMultiEvent _self;
  final $Res Function(SearchMultiEvent) _then;

/// Create a copy of ExploreEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,Object? language = freezed,Object? page = freezed,}) {
  return _then(SearchMultiEvent(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class TrendingEvent implements ExploreEvent {
  const TrendingEvent({this.language});
  

 final  String? language;

/// Create a copy of ExploreEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrendingEventCopyWith<TrendingEvent> get copyWith => _$TrendingEventCopyWithImpl<TrendingEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrendingEvent&&(identical(other.language, language) || other.language == language));
}


@override
int get hashCode => Object.hash(runtimeType,language);

@override
String toString() {
  return 'ExploreEvent.trending(language: $language)';
}


}

/// @nodoc
abstract mixin class $TrendingEventCopyWith<$Res> implements $ExploreEventCopyWith<$Res> {
  factory $TrendingEventCopyWith(TrendingEvent value, $Res Function(TrendingEvent) _then) = _$TrendingEventCopyWithImpl;
@useResult
$Res call({
 String? language
});




}
/// @nodoc
class _$TrendingEventCopyWithImpl<$Res>
    implements $TrendingEventCopyWith<$Res> {
  _$TrendingEventCopyWithImpl(this._self, this._then);

  final TrendingEvent _self;
  final $Res Function(TrendingEvent) _then;

/// Create a copy of ExploreEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? language = freezed,}) {
  return _then(TrendingEvent(
language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class SearchMoviesEvent implements ExploreEvent {
  const SearchMoviesEvent({required this.query, this.language, this.page, this.primaryReleaseYear, this.region, this.year});
  

 final  String query;
 final  String? language;
 final  int? page;
 final  String? primaryReleaseYear;
 final  String? region;
 final  String? year;

/// Create a copy of ExploreEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchMoviesEventCopyWith<SearchMoviesEvent> get copyWith => _$SearchMoviesEventCopyWithImpl<SearchMoviesEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchMoviesEvent&&(identical(other.query, query) || other.query == query)&&(identical(other.language, language) || other.language == language)&&(identical(other.page, page) || other.page == page)&&(identical(other.primaryReleaseYear, primaryReleaseYear) || other.primaryReleaseYear == primaryReleaseYear)&&(identical(other.region, region) || other.region == region)&&(identical(other.year, year) || other.year == year));
}


@override
int get hashCode => Object.hash(runtimeType,query,language,page,primaryReleaseYear,region,year);

@override
String toString() {
  return 'ExploreEvent.searchMovies(query: $query, language: $language, page: $page, primaryReleaseYear: $primaryReleaseYear, region: $region, year: $year)';
}


}

/// @nodoc
abstract mixin class $SearchMoviesEventCopyWith<$Res> implements $ExploreEventCopyWith<$Res> {
  factory $SearchMoviesEventCopyWith(SearchMoviesEvent value, $Res Function(SearchMoviesEvent) _then) = _$SearchMoviesEventCopyWithImpl;
@useResult
$Res call({
 String query, String? language, int? page, String? primaryReleaseYear, String? region, String? year
});




}
/// @nodoc
class _$SearchMoviesEventCopyWithImpl<$Res>
    implements $SearchMoviesEventCopyWith<$Res> {
  _$SearchMoviesEventCopyWithImpl(this._self, this._then);

  final SearchMoviesEvent _self;
  final $Res Function(SearchMoviesEvent) _then;

/// Create a copy of ExploreEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,Object? language = freezed,Object? page = freezed,Object? primaryReleaseYear = freezed,Object? region = freezed,Object? year = freezed,}) {
  return _then(SearchMoviesEvent(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,primaryReleaseYear: freezed == primaryReleaseYear ? _self.primaryReleaseYear : primaryReleaseYear // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class SearchTvShowsEvent implements ExploreEvent {
  const SearchTvShowsEvent({required this.query, this.language, this.page, this.firstAirDateYear, this.year});
  

 final  String query;
 final  String? language;
 final  int? page;
 final  String? firstAirDateYear;
 final  int? year;

/// Create a copy of ExploreEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchTvShowsEventCopyWith<SearchTvShowsEvent> get copyWith => _$SearchTvShowsEventCopyWithImpl<SearchTvShowsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchTvShowsEvent&&(identical(other.query, query) || other.query == query)&&(identical(other.language, language) || other.language == language)&&(identical(other.page, page) || other.page == page)&&(identical(other.firstAirDateYear, firstAirDateYear) || other.firstAirDateYear == firstAirDateYear)&&(identical(other.year, year) || other.year == year));
}


@override
int get hashCode => Object.hash(runtimeType,query,language,page,firstAirDateYear,year);

@override
String toString() {
  return 'ExploreEvent.searchTvShows(query: $query, language: $language, page: $page, firstAirDateYear: $firstAirDateYear, year: $year)';
}


}

/// @nodoc
abstract mixin class $SearchTvShowsEventCopyWith<$Res> implements $ExploreEventCopyWith<$Res> {
  factory $SearchTvShowsEventCopyWith(SearchTvShowsEvent value, $Res Function(SearchTvShowsEvent) _then) = _$SearchTvShowsEventCopyWithImpl;
@useResult
$Res call({
 String query, String? language, int? page, String? firstAirDateYear, int? year
});




}
/// @nodoc
class _$SearchTvShowsEventCopyWithImpl<$Res>
    implements $SearchTvShowsEventCopyWith<$Res> {
  _$SearchTvShowsEventCopyWithImpl(this._self, this._then);

  final SearchTvShowsEvent _self;
  final $Res Function(SearchTvShowsEvent) _then;

/// Create a copy of ExploreEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,Object? language = freezed,Object? page = freezed,Object? firstAirDateYear = freezed,Object? year = freezed,}) {
  return _then(SearchTvShowsEvent(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,firstAirDateYear: freezed == firstAirDateYear ? _self.firstAirDateYear : firstAirDateYear // ignore: cast_nullable_to_non_nullable
as String?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class SearchPersonEvent implements ExploreEvent {
  const SearchPersonEvent({required this.query, this.language, this.page});
  

 final  String query;
 final  String? language;
 final  int? page;

/// Create a copy of ExploreEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchPersonEventCopyWith<SearchPersonEvent> get copyWith => _$SearchPersonEventCopyWithImpl<SearchPersonEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchPersonEvent&&(identical(other.query, query) || other.query == query)&&(identical(other.language, language) || other.language == language)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,query,language,page);

@override
String toString() {
  return 'ExploreEvent.searchPerson(query: $query, language: $language, page: $page)';
}


}

/// @nodoc
abstract mixin class $SearchPersonEventCopyWith<$Res> implements $ExploreEventCopyWith<$Res> {
  factory $SearchPersonEventCopyWith(SearchPersonEvent value, $Res Function(SearchPersonEvent) _then) = _$SearchPersonEventCopyWithImpl;
@useResult
$Res call({
 String query, String? language, int? page
});




}
/// @nodoc
class _$SearchPersonEventCopyWithImpl<$Res>
    implements $SearchPersonEventCopyWith<$Res> {
  _$SearchPersonEventCopyWithImpl(this._self, this._then);

  final SearchPersonEvent _self;
  final $Res Function(SearchPersonEvent) _then;

/// Create a copy of ExploreEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,Object? language = freezed,Object? page = freezed,}) {
  return _then(SearchPersonEvent(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class SearchCompanyEvent implements ExploreEvent {
  const SearchCompanyEvent({required this.query, this.page});
  

 final  String query;
 final  int? page;

/// Create a copy of ExploreEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchCompanyEventCopyWith<SearchCompanyEvent> get copyWith => _$SearchCompanyEventCopyWithImpl<SearchCompanyEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchCompanyEvent&&(identical(other.query, query) || other.query == query)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,query,page);

@override
String toString() {
  return 'ExploreEvent.searchCompany(query: $query, page: $page)';
}


}

/// @nodoc
abstract mixin class $SearchCompanyEventCopyWith<$Res> implements $ExploreEventCopyWith<$Res> {
  factory $SearchCompanyEventCopyWith(SearchCompanyEvent value, $Res Function(SearchCompanyEvent) _then) = _$SearchCompanyEventCopyWithImpl;
@useResult
$Res call({
 String query, int? page
});




}
/// @nodoc
class _$SearchCompanyEventCopyWithImpl<$Res>
    implements $SearchCompanyEventCopyWith<$Res> {
  _$SearchCompanyEventCopyWithImpl(this._self, this._then);

  final SearchCompanyEvent _self;
  final $Res Function(SearchCompanyEvent) _then;

/// Create a copy of ExploreEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,Object? page = freezed,}) {
  return _then(SearchCompanyEvent(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class ClearSearchEvent implements ExploreEvent {
  const ClearSearchEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearSearchEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExploreEvent.clearSearch()';
}


}




// dart format on
