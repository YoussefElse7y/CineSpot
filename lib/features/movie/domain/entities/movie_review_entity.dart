class MovieReviewEntity {
  final String author;
  final AuthorDetailsEntity authorDetails;
  final String content;
  final String createdAt;
  final String id;
  final String updatedAt;
  final String url;

  const MovieReviewEntity({
    required this.author,
    required this.authorDetails,
    required this.content,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.url,
  });
}

class AuthorDetailsEntity {
  final String name;
  final String username;
  final String? avatarPath;
  final num? rating;

  const AuthorDetailsEntity({
    required this.name,
    required this.username,
    required this.avatarPath,
    required this.rating,
  });
}
