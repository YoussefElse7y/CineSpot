class TvShowReviewEntity {
  final int id;
  final int page;
  final List<TvShowReviewResultEntity> results;
  final int totalPages;
  final int totalResults;

  TvShowReviewEntity({
    required this.id,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}

class TvShowReviewResultEntity {
  final String author;
  final TvShowAuthorDetailsEntity authorDetails;
  final String content;
  final String createdAt;
  final String id;
  final String updatedAt;
  final String url;

  TvShowReviewResultEntity({
    required this.author,
    required this.authorDetails,
    required this.content,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.url,
  });
}

class TvShowAuthorDetailsEntity {
  final String name;
  final String username;
  final String? avatarPath;
  final int? rating;

  TvShowAuthorDetailsEntity({
    required this.name,
    required this.username,
    this.avatarPath,
    this.rating,
  });
}
