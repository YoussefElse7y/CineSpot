// tv_show_reviews_model.dart

import 'package:cine_spot/features/tv_show/domain/entities/tv_show_review_entity.dart';

class TvShowReviewModel extends TvShowReviewEntity {
  TvShowReviewModel({
    required int id,
    required int page,
    required List<TvShowReviewResultModel> results,
    required int totalPages,
    required int totalResults,
  }) : super(
         id: id,
         page: page,
         results: results,
         totalPages: totalPages,
         totalResults: totalResults,
       );

  factory TvShowReviewModel.fromJson(Map<String, dynamic> json) {
    return TvShowReviewModel(
      id: json['id'] ?? 0,
      page: json['page'] ?? 1,
      results: (json['results'] as List<dynamic>? ?? [])
          .map((e) => TvShowReviewResultModel.fromJson(e))
          .toList(),
      totalPages: json['total_pages'] ?? 1,
      totalResults: json['total_results'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'page': page,
      'results': results
          .map((e) => (e as TvShowReviewResultModel).toJson())
          .toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }

  TvShowReviewEntity toEntity() {
    return TvShowReviewEntity(
      id: id,
      page: page,
      results: results
          .map((e) => (e as TvShowReviewResultModel).toEntity())
          .toList(),
      totalPages: totalPages,
      totalResults: totalResults,
    );
  }
}

class TvShowReviewResultModel extends TvShowReviewResultEntity {
  TvShowReviewResultModel({
    required String author,
    required TvShowAuthorDetailsModel authorDetails,
    required String content,
    required String createdAt,
    required String id,
    required String updatedAt,
    required String url,
  }) : super(
         author: author,
         authorDetails: authorDetails,
         content: content,
         createdAt: createdAt,
         id: id,
         updatedAt: updatedAt,
         url: url,
       );

  factory TvShowReviewResultModel.fromJson(Map<String, dynamic> json) {
    return TvShowReviewResultModel(
      author: json['author'] ?? '',
      authorDetails: TvShowAuthorDetailsModel.fromJson(
        json['author_details'] ?? {},
      ),
      content: json['content'] ?? '',
      createdAt: json['created_at'] ?? '',
      id: json['id'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      url: json['url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'author_details': (authorDetails as TvShowAuthorDetailsModel).toJson(),
      'content': content,
      'created_at': createdAt,
      'id': id,
      'updated_at': updatedAt,
      'url': url,
    };
  }

  TvShowReviewResultEntity toEntity() {
    return TvShowReviewResultEntity(
      author: author,
      authorDetails: (authorDetails as TvShowAuthorDetailsModel).toEntity(),
      content: content,
      createdAt: createdAt,
      id: id,
      updatedAt: updatedAt,
      url: url,
    );
  }
}

class TvShowAuthorDetailsModel extends TvShowAuthorDetailsEntity {
  TvShowAuthorDetailsModel({
    required String name,
    required String username,
    String? avatarPath,
    double? rating,
  }) : super(
         name: name,
         username: username,
         avatarPath: avatarPath,
         rating: rating,
       );

  factory TvShowAuthorDetailsModel.fromJson(Map<String, dynamic> json) {
    return TvShowAuthorDetailsModel(
      name: json['name'] ?? '',
      username: json['username'] ?? '',
      avatarPath: json['avatar_path'],
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'avatar_path': avatarPath,
      'rating': rating,
    };
  }

  TvShowAuthorDetailsEntity toEntity() {
    return TvShowAuthorDetailsEntity(
      name: name,
      username: username,
      avatarPath: avatarPath,
      rating: rating,
    );
  }
}
