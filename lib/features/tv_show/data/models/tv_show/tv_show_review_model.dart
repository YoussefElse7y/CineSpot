import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/tv_show_review_entity.dart';

part 'tv_show_review_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TvShowReviewModel {
  final int id;
  final int page;
  final List<TvShowReviewResultModel> results;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @JsonKey(name: 'total_results')
  final int totalResults;

  TvShowReviewModel({
    required this.id,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory TvShowReviewModel.fromJson(Map<String, dynamic> json) =>
      _$TvShowReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvShowReviewModelToJson(this);

  /// ✅ Convert model to entity
  TvShowReviewEntity toEntity() => TvShowReviewEntity(
        id: id,
        page: page,
        results: results.map((r) => r.toEntity()).toList(),
        totalPages: totalPages,
        totalResults: totalResults,
      );
}

@JsonSerializable(explicitToJson: true)
class TvShowReviewResultModel {
  final String author;
  @JsonKey(name: 'author_details')
  final TvShowAuthorDetailsModel authorDetails;
  final String content;
  @JsonKey(name: 'created_at')
  final String createdAt;
  final String id;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  final String url;

  TvShowReviewResultModel({
    required this.author,
    required this.authorDetails,
    required this.content,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.url,
  });

  factory TvShowReviewResultModel.fromJson(Map<String, dynamic> json) =>
      _$TvShowReviewResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvShowReviewResultModelToJson(this);

  TvShowReviewResultEntity toEntity() => TvShowReviewResultEntity(
        author: author,
        authorDetails: authorDetails.toEntity(),
        content: content,
        createdAt: createdAt,
        id: id,
        updatedAt: updatedAt,
        url: url,
      );
}

@JsonSerializable()
class TvShowAuthorDetailsModel {
  final String name;
  final String username;
  @JsonKey(name: 'avatar_path')
  final String? avatarPath;
  final int? rating;

  TvShowAuthorDetailsModel({
    required this.name,
    required this.username,
    this.avatarPath,
    this.rating,
  });

  factory TvShowAuthorDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$TvShowAuthorDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvShowAuthorDetailsModelToJson(this);

  TvShowAuthorDetailsEntity toEntity() => TvShowAuthorDetailsEntity(
        name: name,
        username: username,
        avatarPath: avatarPath,
        rating: rating,
      );
}
