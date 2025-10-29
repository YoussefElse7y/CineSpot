// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MovieEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MovieEvent()';
}


}

/// @nodoc
class $MovieEventCopyWith<$Res>  {
$MovieEventCopyWith(MovieEvent _, $Res Function(MovieEvent) __);
}


/// Adds pattern-matching-related methods to [MovieEvent].
extension MovieEventPatterns on MovieEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadMovieDetails value)?  loadMovieDetails,TResult Function( LoadCredits value)?  loadCredits,TResult Function( LoadVideos value)?  loadVideos,TResult Function( LoadSimilarMovies value)?  loadSimilarMovies,TResult Function( LoadRecommendations value)?  loadRecommendations,TResult Function( LoadReviews value)?  loadReviews,TResult Function( LoadWatchProviders value)?  loadWatchProviders,TResult Function( ResetMovie value)?  resetMovie,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadMovieDetails() when loadMovieDetails != null:
return loadMovieDetails(_that);case LoadCredits() when loadCredits != null:
return loadCredits(_that);case LoadVideos() when loadVideos != null:
return loadVideos(_that);case LoadSimilarMovies() when loadSimilarMovies != null:
return loadSimilarMovies(_that);case LoadRecommendations() when loadRecommendations != null:
return loadRecommendations(_that);case LoadReviews() when loadReviews != null:
return loadReviews(_that);case LoadWatchProviders() when loadWatchProviders != null:
return loadWatchProviders(_that);case ResetMovie() when resetMovie != null:
return resetMovie(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadMovieDetails value)  loadMovieDetails,required TResult Function( LoadCredits value)  loadCredits,required TResult Function( LoadVideos value)  loadVideos,required TResult Function( LoadSimilarMovies value)  loadSimilarMovies,required TResult Function( LoadRecommendations value)  loadRecommendations,required TResult Function( LoadReviews value)  loadReviews,required TResult Function( LoadWatchProviders value)  loadWatchProviders,required TResult Function( ResetMovie value)  resetMovie,}){
final _that = this;
switch (_that) {
case LoadMovieDetails():
return loadMovieDetails(_that);case LoadCredits():
return loadCredits(_that);case LoadVideos():
return loadVideos(_that);case LoadSimilarMovies():
return loadSimilarMovies(_that);case LoadRecommendations():
return loadRecommendations(_that);case LoadReviews():
return loadReviews(_that);case LoadWatchProviders():
return loadWatchProviders(_that);case ResetMovie():
return resetMovie(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadMovieDetails value)?  loadMovieDetails,TResult? Function( LoadCredits value)?  loadCredits,TResult? Function( LoadVideos value)?  loadVideos,TResult? Function( LoadSimilarMovies value)?  loadSimilarMovies,TResult? Function( LoadRecommendations value)?  loadRecommendations,TResult? Function( LoadReviews value)?  loadReviews,TResult? Function( LoadWatchProviders value)?  loadWatchProviders,TResult? Function( ResetMovie value)?  resetMovie,}){
final _that = this;
switch (_that) {
case LoadMovieDetails() when loadMovieDetails != null:
return loadMovieDetails(_that);case LoadCredits() when loadCredits != null:
return loadCredits(_that);case LoadVideos() when loadVideos != null:
return loadVideos(_that);case LoadSimilarMovies() when loadSimilarMovies != null:
return loadSimilarMovies(_that);case LoadRecommendations() when loadRecommendations != null:
return loadRecommendations(_that);case LoadReviews() when loadReviews != null:
return loadReviews(_that);case LoadWatchProviders() when loadWatchProviders != null:
return loadWatchProviders(_that);case ResetMovie() when resetMovie != null:
return resetMovie(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int movieId,  String? language)?  loadMovieDetails,TResult Function( int movieId,  String? language)?  loadCredits,TResult Function( int movieId,  String? language)?  loadVideos,TResult Function( int movieId,  String? language,  int? page)?  loadSimilarMovies,TResult Function( int movieId,  String? language,  int? page)?  loadRecommendations,TResult Function( int movieId,  String? language,  int? page)?  loadReviews,TResult Function( int movieId)?  loadWatchProviders,TResult Function()?  resetMovie,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadMovieDetails() when loadMovieDetails != null:
return loadMovieDetails(_that.movieId,_that.language);case LoadCredits() when loadCredits != null:
return loadCredits(_that.movieId,_that.language);case LoadVideos() when loadVideos != null:
return loadVideos(_that.movieId,_that.language);case LoadSimilarMovies() when loadSimilarMovies != null:
return loadSimilarMovies(_that.movieId,_that.language,_that.page);case LoadRecommendations() when loadRecommendations != null:
return loadRecommendations(_that.movieId,_that.language,_that.page);case LoadReviews() when loadReviews != null:
return loadReviews(_that.movieId,_that.language,_that.page);case LoadWatchProviders() when loadWatchProviders != null:
return loadWatchProviders(_that.movieId);case ResetMovie() when resetMovie != null:
return resetMovie();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int movieId,  String? language)  loadMovieDetails,required TResult Function( int movieId,  String? language)  loadCredits,required TResult Function( int movieId,  String? language)  loadVideos,required TResult Function( int movieId,  String? language,  int? page)  loadSimilarMovies,required TResult Function( int movieId,  String? language,  int? page)  loadRecommendations,required TResult Function( int movieId,  String? language,  int? page)  loadReviews,required TResult Function( int movieId)  loadWatchProviders,required TResult Function()  resetMovie,}) {final _that = this;
switch (_that) {
case LoadMovieDetails():
return loadMovieDetails(_that.movieId,_that.language);case LoadCredits():
return loadCredits(_that.movieId,_that.language);case LoadVideos():
return loadVideos(_that.movieId,_that.language);case LoadSimilarMovies():
return loadSimilarMovies(_that.movieId,_that.language,_that.page);case LoadRecommendations():
return loadRecommendations(_that.movieId,_that.language,_that.page);case LoadReviews():
return loadReviews(_that.movieId,_that.language,_that.page);case LoadWatchProviders():
return loadWatchProviders(_that.movieId);case ResetMovie():
return resetMovie();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int movieId,  String? language)?  loadMovieDetails,TResult? Function( int movieId,  String? language)?  loadCredits,TResult? Function( int movieId,  String? language)?  loadVideos,TResult? Function( int movieId,  String? language,  int? page)?  loadSimilarMovies,TResult? Function( int movieId,  String? language,  int? page)?  loadRecommendations,TResult? Function( int movieId,  String? language,  int? page)?  loadReviews,TResult? Function( int movieId)?  loadWatchProviders,TResult? Function()?  resetMovie,}) {final _that = this;
switch (_that) {
case LoadMovieDetails() when loadMovieDetails != null:
return loadMovieDetails(_that.movieId,_that.language);case LoadCredits() when loadCredits != null:
return loadCredits(_that.movieId,_that.language);case LoadVideos() when loadVideos != null:
return loadVideos(_that.movieId,_that.language);case LoadSimilarMovies() when loadSimilarMovies != null:
return loadSimilarMovies(_that.movieId,_that.language,_that.page);case LoadRecommendations() when loadRecommendations != null:
return loadRecommendations(_that.movieId,_that.language,_that.page);case LoadReviews() when loadReviews != null:
return loadReviews(_that.movieId,_that.language,_that.page);case LoadWatchProviders() when loadWatchProviders != null:
return loadWatchProviders(_that.movieId);case ResetMovie() when resetMovie != null:
return resetMovie();case _:
  return null;

}
}

}

/// @nodoc


class LoadMovieDetails implements MovieEvent {
  const LoadMovieDetails(this.movieId, {this.language});
  

 final  int movieId;
 final  String? language;

/// Create a copy of MovieEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadMovieDetailsCopyWith<LoadMovieDetails> get copyWith => _$LoadMovieDetailsCopyWithImpl<LoadMovieDetails>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadMovieDetails&&(identical(other.movieId, movieId) || other.movieId == movieId)&&(identical(other.language, language) || other.language == language));
}


@override
int get hashCode => Object.hash(runtimeType,movieId,language);

@override
String toString() {
  return 'MovieEvent.loadMovieDetails(movieId: $movieId, language: $language)';
}


}

/// @nodoc
abstract mixin class $LoadMovieDetailsCopyWith<$Res> implements $MovieEventCopyWith<$Res> {
  factory $LoadMovieDetailsCopyWith(LoadMovieDetails value, $Res Function(LoadMovieDetails) _then) = _$LoadMovieDetailsCopyWithImpl;
@useResult
$Res call({
 int movieId, String? language
});




}
/// @nodoc
class _$LoadMovieDetailsCopyWithImpl<$Res>
    implements $LoadMovieDetailsCopyWith<$Res> {
  _$LoadMovieDetailsCopyWithImpl(this._self, this._then);

  final LoadMovieDetails _self;
  final $Res Function(LoadMovieDetails) _then;

/// Create a copy of MovieEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movieId = null,Object? language = freezed,}) {
  return _then(LoadMovieDetails(
null == movieId ? _self.movieId : movieId // ignore: cast_nullable_to_non_nullable
as int,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class LoadCredits implements MovieEvent {
  const LoadCredits(this.movieId, {this.language});
  

 final  int movieId;
 final  String? language;

/// Create a copy of MovieEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadCreditsCopyWith<LoadCredits> get copyWith => _$LoadCreditsCopyWithImpl<LoadCredits>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadCredits&&(identical(other.movieId, movieId) || other.movieId == movieId)&&(identical(other.language, language) || other.language == language));
}


@override
int get hashCode => Object.hash(runtimeType,movieId,language);

@override
String toString() {
  return 'MovieEvent.loadCredits(movieId: $movieId, language: $language)';
}


}

/// @nodoc
abstract mixin class $LoadCreditsCopyWith<$Res> implements $MovieEventCopyWith<$Res> {
  factory $LoadCreditsCopyWith(LoadCredits value, $Res Function(LoadCredits) _then) = _$LoadCreditsCopyWithImpl;
@useResult
$Res call({
 int movieId, String? language
});




}
/// @nodoc
class _$LoadCreditsCopyWithImpl<$Res>
    implements $LoadCreditsCopyWith<$Res> {
  _$LoadCreditsCopyWithImpl(this._self, this._then);

  final LoadCredits _self;
  final $Res Function(LoadCredits) _then;

/// Create a copy of MovieEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movieId = null,Object? language = freezed,}) {
  return _then(LoadCredits(
null == movieId ? _self.movieId : movieId // ignore: cast_nullable_to_non_nullable
as int,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class LoadVideos implements MovieEvent {
  const LoadVideos(this.movieId, {this.language});
  

 final  int movieId;
 final  String? language;

/// Create a copy of MovieEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadVideosCopyWith<LoadVideos> get copyWith => _$LoadVideosCopyWithImpl<LoadVideos>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadVideos&&(identical(other.movieId, movieId) || other.movieId == movieId)&&(identical(other.language, language) || other.language == language));
}


@override
int get hashCode => Object.hash(runtimeType,movieId,language);

@override
String toString() {
  return 'MovieEvent.loadVideos(movieId: $movieId, language: $language)';
}


}

/// @nodoc
abstract mixin class $LoadVideosCopyWith<$Res> implements $MovieEventCopyWith<$Res> {
  factory $LoadVideosCopyWith(LoadVideos value, $Res Function(LoadVideos) _then) = _$LoadVideosCopyWithImpl;
@useResult
$Res call({
 int movieId, String? language
});




}
/// @nodoc
class _$LoadVideosCopyWithImpl<$Res>
    implements $LoadVideosCopyWith<$Res> {
  _$LoadVideosCopyWithImpl(this._self, this._then);

  final LoadVideos _self;
  final $Res Function(LoadVideos) _then;

/// Create a copy of MovieEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movieId = null,Object? language = freezed,}) {
  return _then(LoadVideos(
null == movieId ? _self.movieId : movieId // ignore: cast_nullable_to_non_nullable
as int,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class LoadSimilarMovies implements MovieEvent {
  const LoadSimilarMovies(this.movieId, {this.language, this.page});
  

 final  int movieId;
 final  String? language;
 final  int? page;

/// Create a copy of MovieEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadSimilarMoviesCopyWith<LoadSimilarMovies> get copyWith => _$LoadSimilarMoviesCopyWithImpl<LoadSimilarMovies>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadSimilarMovies&&(identical(other.movieId, movieId) || other.movieId == movieId)&&(identical(other.language, language) || other.language == language)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,movieId,language,page);

@override
String toString() {
  return 'MovieEvent.loadSimilarMovies(movieId: $movieId, language: $language, page: $page)';
}


}

/// @nodoc
abstract mixin class $LoadSimilarMoviesCopyWith<$Res> implements $MovieEventCopyWith<$Res> {
  factory $LoadSimilarMoviesCopyWith(LoadSimilarMovies value, $Res Function(LoadSimilarMovies) _then) = _$LoadSimilarMoviesCopyWithImpl;
@useResult
$Res call({
 int movieId, String? language, int? page
});




}
/// @nodoc
class _$LoadSimilarMoviesCopyWithImpl<$Res>
    implements $LoadSimilarMoviesCopyWith<$Res> {
  _$LoadSimilarMoviesCopyWithImpl(this._self, this._then);

  final LoadSimilarMovies _self;
  final $Res Function(LoadSimilarMovies) _then;

/// Create a copy of MovieEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movieId = null,Object? language = freezed,Object? page = freezed,}) {
  return _then(LoadSimilarMovies(
null == movieId ? _self.movieId : movieId // ignore: cast_nullable_to_non_nullable
as int,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class LoadRecommendations implements MovieEvent {
  const LoadRecommendations(this.movieId, {this.language, this.page});
  

 final  int movieId;
 final  String? language;
 final  int? page;

/// Create a copy of MovieEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadRecommendationsCopyWith<LoadRecommendations> get copyWith => _$LoadRecommendationsCopyWithImpl<LoadRecommendations>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadRecommendations&&(identical(other.movieId, movieId) || other.movieId == movieId)&&(identical(other.language, language) || other.language == language)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,movieId,language,page);

@override
String toString() {
  return 'MovieEvent.loadRecommendations(movieId: $movieId, language: $language, page: $page)';
}


}

/// @nodoc
abstract mixin class $LoadRecommendationsCopyWith<$Res> implements $MovieEventCopyWith<$Res> {
  factory $LoadRecommendationsCopyWith(LoadRecommendations value, $Res Function(LoadRecommendations) _then) = _$LoadRecommendationsCopyWithImpl;
@useResult
$Res call({
 int movieId, String? language, int? page
});




}
/// @nodoc
class _$LoadRecommendationsCopyWithImpl<$Res>
    implements $LoadRecommendationsCopyWith<$Res> {
  _$LoadRecommendationsCopyWithImpl(this._self, this._then);

  final LoadRecommendations _self;
  final $Res Function(LoadRecommendations) _then;

/// Create a copy of MovieEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movieId = null,Object? language = freezed,Object? page = freezed,}) {
  return _then(LoadRecommendations(
null == movieId ? _self.movieId : movieId // ignore: cast_nullable_to_non_nullable
as int,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class LoadReviews implements MovieEvent {
  const LoadReviews(this.movieId, {this.language, this.page});
  

 final  int movieId;
 final  String? language;
 final  int? page;

/// Create a copy of MovieEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadReviewsCopyWith<LoadReviews> get copyWith => _$LoadReviewsCopyWithImpl<LoadReviews>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadReviews&&(identical(other.movieId, movieId) || other.movieId == movieId)&&(identical(other.language, language) || other.language == language)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,movieId,language,page);

@override
String toString() {
  return 'MovieEvent.loadReviews(movieId: $movieId, language: $language, page: $page)';
}


}

/// @nodoc
abstract mixin class $LoadReviewsCopyWith<$Res> implements $MovieEventCopyWith<$Res> {
  factory $LoadReviewsCopyWith(LoadReviews value, $Res Function(LoadReviews) _then) = _$LoadReviewsCopyWithImpl;
@useResult
$Res call({
 int movieId, String? language, int? page
});




}
/// @nodoc
class _$LoadReviewsCopyWithImpl<$Res>
    implements $LoadReviewsCopyWith<$Res> {
  _$LoadReviewsCopyWithImpl(this._self, this._then);

  final LoadReviews _self;
  final $Res Function(LoadReviews) _then;

/// Create a copy of MovieEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movieId = null,Object? language = freezed,Object? page = freezed,}) {
  return _then(LoadReviews(
null == movieId ? _self.movieId : movieId // ignore: cast_nullable_to_non_nullable
as int,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class LoadWatchProviders implements MovieEvent {
  const LoadWatchProviders(this.movieId);
  

 final  int movieId;

/// Create a copy of MovieEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadWatchProvidersCopyWith<LoadWatchProviders> get copyWith => _$LoadWatchProvidersCopyWithImpl<LoadWatchProviders>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadWatchProviders&&(identical(other.movieId, movieId) || other.movieId == movieId));
}


@override
int get hashCode => Object.hash(runtimeType,movieId);

@override
String toString() {
  return 'MovieEvent.loadWatchProviders(movieId: $movieId)';
}


}

/// @nodoc
abstract mixin class $LoadWatchProvidersCopyWith<$Res> implements $MovieEventCopyWith<$Res> {
  factory $LoadWatchProvidersCopyWith(LoadWatchProviders value, $Res Function(LoadWatchProviders) _then) = _$LoadWatchProvidersCopyWithImpl;
@useResult
$Res call({
 int movieId
});




}
/// @nodoc
class _$LoadWatchProvidersCopyWithImpl<$Res>
    implements $LoadWatchProvidersCopyWith<$Res> {
  _$LoadWatchProvidersCopyWithImpl(this._self, this._then);

  final LoadWatchProviders _self;
  final $Res Function(LoadWatchProviders) _then;

/// Create a copy of MovieEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movieId = null,}) {
  return _then(LoadWatchProviders(
null == movieId ? _self.movieId : movieId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ResetMovie implements MovieEvent {
  const ResetMovie();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetMovie);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MovieEvent.resetMovie()';
}


}




/// @nodoc
mixin _$MovieState {

 MovieDetailsStatus get detailsStatus; MovieCreditsStatus get creditsStatus; MovieVideosStatus get videosStatus; MovieSimilarStatus get similarStatus; MovieRecommendationsStatus get recommendationsStatus; MovieReviewsStatus get reviewsStatus; MovieWatchProvidersStatus get watchProvidersStatus;// ✅ NEW
 MovieDetailsEntity? get movieDetails; CreditsEntity? get credits; MovieVideosEntity? get videos; SimilarMoviesResponseEntity? get similarMovies; RecommendationsEntity? get recommendations; List<MovieReviewEntity>? get reviews; MovieWatchProvidersEntity? get watchProviders;// ✅ NEW
 String? get detailsError; String? get creditsError; String? get videosError; String? get similarError; String? get recommendationsError; String? get reviewsError; String? get watchProvidersError;
/// Create a copy of MovieState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieStateCopyWith<MovieState> get copyWith => _$MovieStateCopyWithImpl<MovieState>(this as MovieState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieState&&(identical(other.detailsStatus, detailsStatus) || other.detailsStatus == detailsStatus)&&(identical(other.creditsStatus, creditsStatus) || other.creditsStatus == creditsStatus)&&(identical(other.videosStatus, videosStatus) || other.videosStatus == videosStatus)&&(identical(other.similarStatus, similarStatus) || other.similarStatus == similarStatus)&&(identical(other.recommendationsStatus, recommendationsStatus) || other.recommendationsStatus == recommendationsStatus)&&(identical(other.reviewsStatus, reviewsStatus) || other.reviewsStatus == reviewsStatus)&&(identical(other.watchProvidersStatus, watchProvidersStatus) || other.watchProvidersStatus == watchProvidersStatus)&&(identical(other.movieDetails, movieDetails) || other.movieDetails == movieDetails)&&(identical(other.credits, credits) || other.credits == credits)&&(identical(other.videos, videos) || other.videos == videos)&&(identical(other.similarMovies, similarMovies) || other.similarMovies == similarMovies)&&(identical(other.recommendations, recommendations) || other.recommendations == recommendations)&&const DeepCollectionEquality().equals(other.reviews, reviews)&&(identical(other.watchProviders, watchProviders) || other.watchProviders == watchProviders)&&(identical(other.detailsError, detailsError) || other.detailsError == detailsError)&&(identical(other.creditsError, creditsError) || other.creditsError == creditsError)&&(identical(other.videosError, videosError) || other.videosError == videosError)&&(identical(other.similarError, similarError) || other.similarError == similarError)&&(identical(other.recommendationsError, recommendationsError) || other.recommendationsError == recommendationsError)&&(identical(other.reviewsError, reviewsError) || other.reviewsError == reviewsError)&&(identical(other.watchProvidersError, watchProvidersError) || other.watchProvidersError == watchProvidersError));
}


@override
int get hashCode => Object.hashAll([runtimeType,detailsStatus,creditsStatus,videosStatus,similarStatus,recommendationsStatus,reviewsStatus,watchProvidersStatus,movieDetails,credits,videos,similarMovies,recommendations,const DeepCollectionEquality().hash(reviews),watchProviders,detailsError,creditsError,videosError,similarError,recommendationsError,reviewsError,watchProvidersError]);

@override
String toString() {
  return 'MovieState(detailsStatus: $detailsStatus, creditsStatus: $creditsStatus, videosStatus: $videosStatus, similarStatus: $similarStatus, recommendationsStatus: $recommendationsStatus, reviewsStatus: $reviewsStatus, watchProvidersStatus: $watchProvidersStatus, movieDetails: $movieDetails, credits: $credits, videos: $videos, similarMovies: $similarMovies, recommendations: $recommendations, reviews: $reviews, watchProviders: $watchProviders, detailsError: $detailsError, creditsError: $creditsError, videosError: $videosError, similarError: $similarError, recommendationsError: $recommendationsError, reviewsError: $reviewsError, watchProvidersError: $watchProvidersError)';
}


}

/// @nodoc
abstract mixin class $MovieStateCopyWith<$Res>  {
  factory $MovieStateCopyWith(MovieState value, $Res Function(MovieState) _then) = _$MovieStateCopyWithImpl;
@useResult
$Res call({
 MovieDetailsStatus detailsStatus, MovieCreditsStatus creditsStatus, MovieVideosStatus videosStatus, MovieSimilarStatus similarStatus, MovieRecommendationsStatus recommendationsStatus, MovieReviewsStatus reviewsStatus, MovieWatchProvidersStatus watchProvidersStatus, MovieDetailsEntity? movieDetails, CreditsEntity? credits, MovieVideosEntity? videos, SimilarMoviesResponseEntity? similarMovies, RecommendationsEntity? recommendations, List<MovieReviewEntity>? reviews, MovieWatchProvidersEntity? watchProviders, String? detailsError, String? creditsError, String? videosError, String? similarError, String? recommendationsError, String? reviewsError, String? watchProvidersError
});




}
/// @nodoc
class _$MovieStateCopyWithImpl<$Res>
    implements $MovieStateCopyWith<$Res> {
  _$MovieStateCopyWithImpl(this._self, this._then);

  final MovieState _self;
  final $Res Function(MovieState) _then;

/// Create a copy of MovieState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? detailsStatus = null,Object? creditsStatus = null,Object? videosStatus = null,Object? similarStatus = null,Object? recommendationsStatus = null,Object? reviewsStatus = null,Object? watchProvidersStatus = null,Object? movieDetails = freezed,Object? credits = freezed,Object? videos = freezed,Object? similarMovies = freezed,Object? recommendations = freezed,Object? reviews = freezed,Object? watchProviders = freezed,Object? detailsError = freezed,Object? creditsError = freezed,Object? videosError = freezed,Object? similarError = freezed,Object? recommendationsError = freezed,Object? reviewsError = freezed,Object? watchProvidersError = freezed,}) {
  return _then(_self.copyWith(
detailsStatus: null == detailsStatus ? _self.detailsStatus : detailsStatus // ignore: cast_nullable_to_non_nullable
as MovieDetailsStatus,creditsStatus: null == creditsStatus ? _self.creditsStatus : creditsStatus // ignore: cast_nullable_to_non_nullable
as MovieCreditsStatus,videosStatus: null == videosStatus ? _self.videosStatus : videosStatus // ignore: cast_nullable_to_non_nullable
as MovieVideosStatus,similarStatus: null == similarStatus ? _self.similarStatus : similarStatus // ignore: cast_nullable_to_non_nullable
as MovieSimilarStatus,recommendationsStatus: null == recommendationsStatus ? _self.recommendationsStatus : recommendationsStatus // ignore: cast_nullable_to_non_nullable
as MovieRecommendationsStatus,reviewsStatus: null == reviewsStatus ? _self.reviewsStatus : reviewsStatus // ignore: cast_nullable_to_non_nullable
as MovieReviewsStatus,watchProvidersStatus: null == watchProvidersStatus ? _self.watchProvidersStatus : watchProvidersStatus // ignore: cast_nullable_to_non_nullable
as MovieWatchProvidersStatus,movieDetails: freezed == movieDetails ? _self.movieDetails : movieDetails // ignore: cast_nullable_to_non_nullable
as MovieDetailsEntity?,credits: freezed == credits ? _self.credits : credits // ignore: cast_nullable_to_non_nullable
as CreditsEntity?,videos: freezed == videos ? _self.videos : videos // ignore: cast_nullable_to_non_nullable
as MovieVideosEntity?,similarMovies: freezed == similarMovies ? _self.similarMovies : similarMovies // ignore: cast_nullable_to_non_nullable
as SimilarMoviesResponseEntity?,recommendations: freezed == recommendations ? _self.recommendations : recommendations // ignore: cast_nullable_to_non_nullable
as RecommendationsEntity?,reviews: freezed == reviews ? _self.reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<MovieReviewEntity>?,watchProviders: freezed == watchProviders ? _self.watchProviders : watchProviders // ignore: cast_nullable_to_non_nullable
as MovieWatchProvidersEntity?,detailsError: freezed == detailsError ? _self.detailsError : detailsError // ignore: cast_nullable_to_non_nullable
as String?,creditsError: freezed == creditsError ? _self.creditsError : creditsError // ignore: cast_nullable_to_non_nullable
as String?,videosError: freezed == videosError ? _self.videosError : videosError // ignore: cast_nullable_to_non_nullable
as String?,similarError: freezed == similarError ? _self.similarError : similarError // ignore: cast_nullable_to_non_nullable
as String?,recommendationsError: freezed == recommendationsError ? _self.recommendationsError : recommendationsError // ignore: cast_nullable_to_non_nullable
as String?,reviewsError: freezed == reviewsError ? _self.reviewsError : reviewsError // ignore: cast_nullable_to_non_nullable
as String?,watchProvidersError: freezed == watchProvidersError ? _self.watchProvidersError : watchProvidersError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieState].
extension MovieStatePatterns on MovieState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieState value)  $default,){
final _that = this;
switch (_that) {
case _MovieState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieState value)?  $default,){
final _that = this;
switch (_that) {
case _MovieState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MovieDetailsStatus detailsStatus,  MovieCreditsStatus creditsStatus,  MovieVideosStatus videosStatus,  MovieSimilarStatus similarStatus,  MovieRecommendationsStatus recommendationsStatus,  MovieReviewsStatus reviewsStatus,  MovieWatchProvidersStatus watchProvidersStatus,  MovieDetailsEntity? movieDetails,  CreditsEntity? credits,  MovieVideosEntity? videos,  SimilarMoviesResponseEntity? similarMovies,  RecommendationsEntity? recommendations,  List<MovieReviewEntity>? reviews,  MovieWatchProvidersEntity? watchProviders,  String? detailsError,  String? creditsError,  String? videosError,  String? similarError,  String? recommendationsError,  String? reviewsError,  String? watchProvidersError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieState() when $default != null:
return $default(_that.detailsStatus,_that.creditsStatus,_that.videosStatus,_that.similarStatus,_that.recommendationsStatus,_that.reviewsStatus,_that.watchProvidersStatus,_that.movieDetails,_that.credits,_that.videos,_that.similarMovies,_that.recommendations,_that.reviews,_that.watchProviders,_that.detailsError,_that.creditsError,_that.videosError,_that.similarError,_that.recommendationsError,_that.reviewsError,_that.watchProvidersError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MovieDetailsStatus detailsStatus,  MovieCreditsStatus creditsStatus,  MovieVideosStatus videosStatus,  MovieSimilarStatus similarStatus,  MovieRecommendationsStatus recommendationsStatus,  MovieReviewsStatus reviewsStatus,  MovieWatchProvidersStatus watchProvidersStatus,  MovieDetailsEntity? movieDetails,  CreditsEntity? credits,  MovieVideosEntity? videos,  SimilarMoviesResponseEntity? similarMovies,  RecommendationsEntity? recommendations,  List<MovieReviewEntity>? reviews,  MovieWatchProvidersEntity? watchProviders,  String? detailsError,  String? creditsError,  String? videosError,  String? similarError,  String? recommendationsError,  String? reviewsError,  String? watchProvidersError)  $default,) {final _that = this;
switch (_that) {
case _MovieState():
return $default(_that.detailsStatus,_that.creditsStatus,_that.videosStatus,_that.similarStatus,_that.recommendationsStatus,_that.reviewsStatus,_that.watchProvidersStatus,_that.movieDetails,_that.credits,_that.videos,_that.similarMovies,_that.recommendations,_that.reviews,_that.watchProviders,_that.detailsError,_that.creditsError,_that.videosError,_that.similarError,_that.recommendationsError,_that.reviewsError,_that.watchProvidersError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MovieDetailsStatus detailsStatus,  MovieCreditsStatus creditsStatus,  MovieVideosStatus videosStatus,  MovieSimilarStatus similarStatus,  MovieRecommendationsStatus recommendationsStatus,  MovieReviewsStatus reviewsStatus,  MovieWatchProvidersStatus watchProvidersStatus,  MovieDetailsEntity? movieDetails,  CreditsEntity? credits,  MovieVideosEntity? videos,  SimilarMoviesResponseEntity? similarMovies,  RecommendationsEntity? recommendations,  List<MovieReviewEntity>? reviews,  MovieWatchProvidersEntity? watchProviders,  String? detailsError,  String? creditsError,  String? videosError,  String? similarError,  String? recommendationsError,  String? reviewsError,  String? watchProvidersError)?  $default,) {final _that = this;
switch (_that) {
case _MovieState() when $default != null:
return $default(_that.detailsStatus,_that.creditsStatus,_that.videosStatus,_that.similarStatus,_that.recommendationsStatus,_that.reviewsStatus,_that.watchProvidersStatus,_that.movieDetails,_that.credits,_that.videos,_that.similarMovies,_that.recommendations,_that.reviews,_that.watchProviders,_that.detailsError,_that.creditsError,_that.videosError,_that.similarError,_that.recommendationsError,_that.reviewsError,_that.watchProvidersError);case _:
  return null;

}
}

}

/// @nodoc


class _MovieState implements MovieState {
  const _MovieState({this.detailsStatus = MovieDetailsStatus.initial, this.creditsStatus = MovieCreditsStatus.initial, this.videosStatus = MovieVideosStatus.initial, this.similarStatus = MovieSimilarStatus.initial, this.recommendationsStatus = MovieRecommendationsStatus.initial, this.reviewsStatus = MovieReviewsStatus.initial, this.watchProvidersStatus = MovieWatchProvidersStatus.initial, this.movieDetails, this.credits, this.videos, this.similarMovies, this.recommendations, final  List<MovieReviewEntity>? reviews, this.watchProviders, this.detailsError, this.creditsError, this.videosError, this.similarError, this.recommendationsError, this.reviewsError, this.watchProvidersError}): _reviews = reviews;
  

@override@JsonKey() final  MovieDetailsStatus detailsStatus;
@override@JsonKey() final  MovieCreditsStatus creditsStatus;
@override@JsonKey() final  MovieVideosStatus videosStatus;
@override@JsonKey() final  MovieSimilarStatus similarStatus;
@override@JsonKey() final  MovieRecommendationsStatus recommendationsStatus;
@override@JsonKey() final  MovieReviewsStatus reviewsStatus;
@override@JsonKey() final  MovieWatchProvidersStatus watchProvidersStatus;
// ✅ NEW
@override final  MovieDetailsEntity? movieDetails;
@override final  CreditsEntity? credits;
@override final  MovieVideosEntity? videos;
@override final  SimilarMoviesResponseEntity? similarMovies;
@override final  RecommendationsEntity? recommendations;
 final  List<MovieReviewEntity>? _reviews;
@override List<MovieReviewEntity>? get reviews {
  final value = _reviews;
  if (value == null) return null;
  if (_reviews is EqualUnmodifiableListView) return _reviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  MovieWatchProvidersEntity? watchProviders;
// ✅ NEW
@override final  String? detailsError;
@override final  String? creditsError;
@override final  String? videosError;
@override final  String? similarError;
@override final  String? recommendationsError;
@override final  String? reviewsError;
@override final  String? watchProvidersError;

/// Create a copy of MovieState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieStateCopyWith<_MovieState> get copyWith => __$MovieStateCopyWithImpl<_MovieState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieState&&(identical(other.detailsStatus, detailsStatus) || other.detailsStatus == detailsStatus)&&(identical(other.creditsStatus, creditsStatus) || other.creditsStatus == creditsStatus)&&(identical(other.videosStatus, videosStatus) || other.videosStatus == videosStatus)&&(identical(other.similarStatus, similarStatus) || other.similarStatus == similarStatus)&&(identical(other.recommendationsStatus, recommendationsStatus) || other.recommendationsStatus == recommendationsStatus)&&(identical(other.reviewsStatus, reviewsStatus) || other.reviewsStatus == reviewsStatus)&&(identical(other.watchProvidersStatus, watchProvidersStatus) || other.watchProvidersStatus == watchProvidersStatus)&&(identical(other.movieDetails, movieDetails) || other.movieDetails == movieDetails)&&(identical(other.credits, credits) || other.credits == credits)&&(identical(other.videos, videos) || other.videos == videos)&&(identical(other.similarMovies, similarMovies) || other.similarMovies == similarMovies)&&(identical(other.recommendations, recommendations) || other.recommendations == recommendations)&&const DeepCollectionEquality().equals(other._reviews, _reviews)&&(identical(other.watchProviders, watchProviders) || other.watchProviders == watchProviders)&&(identical(other.detailsError, detailsError) || other.detailsError == detailsError)&&(identical(other.creditsError, creditsError) || other.creditsError == creditsError)&&(identical(other.videosError, videosError) || other.videosError == videosError)&&(identical(other.similarError, similarError) || other.similarError == similarError)&&(identical(other.recommendationsError, recommendationsError) || other.recommendationsError == recommendationsError)&&(identical(other.reviewsError, reviewsError) || other.reviewsError == reviewsError)&&(identical(other.watchProvidersError, watchProvidersError) || other.watchProvidersError == watchProvidersError));
}


@override
int get hashCode => Object.hashAll([runtimeType,detailsStatus,creditsStatus,videosStatus,similarStatus,recommendationsStatus,reviewsStatus,watchProvidersStatus,movieDetails,credits,videos,similarMovies,recommendations,const DeepCollectionEquality().hash(_reviews),watchProviders,detailsError,creditsError,videosError,similarError,recommendationsError,reviewsError,watchProvidersError]);

@override
String toString() {
  return 'MovieState(detailsStatus: $detailsStatus, creditsStatus: $creditsStatus, videosStatus: $videosStatus, similarStatus: $similarStatus, recommendationsStatus: $recommendationsStatus, reviewsStatus: $reviewsStatus, watchProvidersStatus: $watchProvidersStatus, movieDetails: $movieDetails, credits: $credits, videos: $videos, similarMovies: $similarMovies, recommendations: $recommendations, reviews: $reviews, watchProviders: $watchProviders, detailsError: $detailsError, creditsError: $creditsError, videosError: $videosError, similarError: $similarError, recommendationsError: $recommendationsError, reviewsError: $reviewsError, watchProvidersError: $watchProvidersError)';
}


}

/// @nodoc
abstract mixin class _$MovieStateCopyWith<$Res> implements $MovieStateCopyWith<$Res> {
  factory _$MovieStateCopyWith(_MovieState value, $Res Function(_MovieState) _then) = __$MovieStateCopyWithImpl;
@override @useResult
$Res call({
 MovieDetailsStatus detailsStatus, MovieCreditsStatus creditsStatus, MovieVideosStatus videosStatus, MovieSimilarStatus similarStatus, MovieRecommendationsStatus recommendationsStatus, MovieReviewsStatus reviewsStatus, MovieWatchProvidersStatus watchProvidersStatus, MovieDetailsEntity? movieDetails, CreditsEntity? credits, MovieVideosEntity? videos, SimilarMoviesResponseEntity? similarMovies, RecommendationsEntity? recommendations, List<MovieReviewEntity>? reviews, MovieWatchProvidersEntity? watchProviders, String? detailsError, String? creditsError, String? videosError, String? similarError, String? recommendationsError, String? reviewsError, String? watchProvidersError
});




}
/// @nodoc
class __$MovieStateCopyWithImpl<$Res>
    implements _$MovieStateCopyWith<$Res> {
  __$MovieStateCopyWithImpl(this._self, this._then);

  final _MovieState _self;
  final $Res Function(_MovieState) _then;

/// Create a copy of MovieState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? detailsStatus = null,Object? creditsStatus = null,Object? videosStatus = null,Object? similarStatus = null,Object? recommendationsStatus = null,Object? reviewsStatus = null,Object? watchProvidersStatus = null,Object? movieDetails = freezed,Object? credits = freezed,Object? videos = freezed,Object? similarMovies = freezed,Object? recommendations = freezed,Object? reviews = freezed,Object? watchProviders = freezed,Object? detailsError = freezed,Object? creditsError = freezed,Object? videosError = freezed,Object? similarError = freezed,Object? recommendationsError = freezed,Object? reviewsError = freezed,Object? watchProvidersError = freezed,}) {
  return _then(_MovieState(
detailsStatus: null == detailsStatus ? _self.detailsStatus : detailsStatus // ignore: cast_nullable_to_non_nullable
as MovieDetailsStatus,creditsStatus: null == creditsStatus ? _self.creditsStatus : creditsStatus // ignore: cast_nullable_to_non_nullable
as MovieCreditsStatus,videosStatus: null == videosStatus ? _self.videosStatus : videosStatus // ignore: cast_nullable_to_non_nullable
as MovieVideosStatus,similarStatus: null == similarStatus ? _self.similarStatus : similarStatus // ignore: cast_nullable_to_non_nullable
as MovieSimilarStatus,recommendationsStatus: null == recommendationsStatus ? _self.recommendationsStatus : recommendationsStatus // ignore: cast_nullable_to_non_nullable
as MovieRecommendationsStatus,reviewsStatus: null == reviewsStatus ? _self.reviewsStatus : reviewsStatus // ignore: cast_nullable_to_non_nullable
as MovieReviewsStatus,watchProvidersStatus: null == watchProvidersStatus ? _self.watchProvidersStatus : watchProvidersStatus // ignore: cast_nullable_to_non_nullable
as MovieWatchProvidersStatus,movieDetails: freezed == movieDetails ? _self.movieDetails : movieDetails // ignore: cast_nullable_to_non_nullable
as MovieDetailsEntity?,credits: freezed == credits ? _self.credits : credits // ignore: cast_nullable_to_non_nullable
as CreditsEntity?,videos: freezed == videos ? _self.videos : videos // ignore: cast_nullable_to_non_nullable
as MovieVideosEntity?,similarMovies: freezed == similarMovies ? _self.similarMovies : similarMovies // ignore: cast_nullable_to_non_nullable
as SimilarMoviesResponseEntity?,recommendations: freezed == recommendations ? _self.recommendations : recommendations // ignore: cast_nullable_to_non_nullable
as RecommendationsEntity?,reviews: freezed == reviews ? _self._reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<MovieReviewEntity>?,watchProviders: freezed == watchProviders ? _self.watchProviders : watchProviders // ignore: cast_nullable_to_non_nullable
as MovieWatchProvidersEntity?,detailsError: freezed == detailsError ? _self.detailsError : detailsError // ignore: cast_nullable_to_non_nullable
as String?,creditsError: freezed == creditsError ? _self.creditsError : creditsError // ignore: cast_nullable_to_non_nullable
as String?,videosError: freezed == videosError ? _self.videosError : videosError // ignore: cast_nullable_to_non_nullable
as String?,similarError: freezed == similarError ? _self.similarError : similarError // ignore: cast_nullable_to_non_nullable
as String?,recommendationsError: freezed == recommendationsError ? _self.recommendationsError : recommendationsError // ignore: cast_nullable_to_non_nullable
as String?,reviewsError: freezed == reviewsError ? _self.reviewsError : reviewsError // ignore: cast_nullable_to_non_nullable
as String?,watchProvidersError: freezed == watchProvidersError ? _self.watchProvidersError : watchProvidersError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
