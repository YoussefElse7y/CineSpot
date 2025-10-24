// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show_review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvShowReviewModel _$TvShowReviewModelFromJson(Map<String, dynamic> json) =>
    TvShowReviewModel(
      id: (json['id'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map(
            (e) => TvShowReviewResultModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      totalPages: (json['total_pages'] as num).toInt(),
      totalResults: (json['total_results'] as num).toInt(),
    );

Map<String, dynamic> _$TvShowReviewModelToJson(TvShowReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'page': instance.page,
      'results': instance.results.map((e) => e.toJson()).toList(),
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };

TvShowReviewResultModel _$TvShowReviewResultModelFromJson(
  Map<String, dynamic> json,
) => TvShowReviewResultModel(
  author: json['author'] as String,
  authorDetails: TvShowAuthorDetailsModel.fromJson(
    json['author_details'] as Map<String, dynamic>,
  ),
  content: json['content'] as String,
  createdAt: json['created_at'] as String,
  id: json['id'] as String,
  updatedAt: json['updated_at'] as String,
  url: json['url'] as String,
);

Map<String, dynamic> _$TvShowReviewResultModelToJson(
  TvShowReviewResultModel instance,
) => <String, dynamic>{
  'author': instance.author,
  'author_details': instance.authorDetails.toJson(),
  'content': instance.content,
  'created_at': instance.createdAt,
  'id': instance.id,
  'updated_at': instance.updatedAt,
  'url': instance.url,
};

TvShowAuthorDetailsModel _$TvShowAuthorDetailsModelFromJson(
  Map<String, dynamic> json,
) => TvShowAuthorDetailsModel(
  name: json['name'] as String,
  username: json['username'] as String,
  avatarPath: json['avatar_path'] as String?,
  rating: (json['rating'] as num?)?.toInt(),
);

Map<String, dynamic> _$TvShowAuthorDetailsModelToJson(
  TvShowAuthorDetailsModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'username': instance.username,
  'avatar_path': instance.avatarPath,
  'rating': instance.rating,
};
