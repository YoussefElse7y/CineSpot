import '../../domain/entities/credits_entity.dart';
import 'cast_model.dart';

class CreditsModel extends CreditsEntity {
  const CreditsModel({
    required int id,
    required List<CastModel> cast,
  }) : super(id: id, cast: cast);

  factory CreditsModel.fromJson(Map<String, dynamic> json) {
    return CreditsModel(
      id: json['id'],
      cast: (json['cast'] as List)
          .map((e) => CastModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cast': (cast as List<CastModel>).map((e) => e.toJson()).toList(),
    };
  }
}