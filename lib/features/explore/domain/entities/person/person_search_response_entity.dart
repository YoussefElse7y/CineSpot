
import 'package:cine_spot/features/explore/domain/entities/person/person_search_entity.dart';

class PersonSearchResponseEntity {
  final int page;
  final List<PersonSearchEntity> results;
  final int totalPages;
  final int totalResults;

  const PersonSearchResponseEntity({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}
