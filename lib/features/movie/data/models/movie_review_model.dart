import '../../domain/entities/movie_review_entity.dart';

class MovieReviewsResponseModel {
  final int id;
  final int page;
  final List<MovieReviewModel> results;

  const MovieReviewsResponseModel({
    required this.id,
    required this.page,
    required this.results,
  });

  factory MovieReviewsResponseModel.fromJson(Map<String, dynamic> json) {
    return MovieReviewsResponseModel(
      id: json['id'],
      page: json['page'],
      results: (json['results'] as List<dynamic>)
          .map((e) => MovieReviewModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'page': page,
      'results': results.map((e) => e.toJson()).toList(),
    };
  }
}

class MovieReviewModel extends MovieReviewEntity {
  const MovieReviewModel({
    required super.author,
    required super.authorDetails,
    required super.content,
    required super.createdAt,
    required super.id,
    required super.updatedAt,
    required super.url,
  });

  factory MovieReviewModel.fromJson(Map<String, dynamic> json) {
    return MovieReviewModel(
      author: json['author'],
      authorDetails: AuthorDetailsModel.fromJson(json['author_details']),
      content: json['content'],
      createdAt: json['created_at'],
      id: json['id'],
      updatedAt: json['updated_at'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'author_details': (authorDetails as AuthorDetailsModel).toJson(),
      'content': content,
      'created_at': createdAt,
      'id': id,
      'updated_at': updatedAt,
      'url': url,
    };
  }
}

class AuthorDetailsModel extends AuthorDetailsEntity {
  const AuthorDetailsModel({
    required super.name,
    required super.username,
    required super.avatarPath,
    required super.rating,
  });

  factory AuthorDetailsModel.fromJson(Map<String, dynamic> json) {
    return AuthorDetailsModel(
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
}
