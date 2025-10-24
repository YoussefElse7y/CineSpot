import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
 abstract class Failure with _$Failure {
  const factory Failure.serverFailure(String message) = ServerFailure;
  const factory Failure.authFailure(String message) = AuthFailure;
  const factory Failure.networkFailure(String message) = NetworkFailure;
  const factory Failure.cacheFailure(String message) = CacheFailure;
  const factory Failure.notFoundFailure(String message) = NotFoundFailure;
}