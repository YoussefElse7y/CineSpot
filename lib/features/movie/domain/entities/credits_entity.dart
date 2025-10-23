import 'package:cine_spot/features/movie/domain/entities/cast_entity.dart';

class CreditsEntity {
  final int id;
  final List<CastEntity> cast;

  const CreditsEntity({
    required this.id,
    required this.cast,
  });
}