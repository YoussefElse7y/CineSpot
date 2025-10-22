
import 'package:cine_spot/features/explore/domain/entities/company/company_search_result_entity.dart';

class CompanySearchResultModel extends CompanySearchResultEntity {
  const CompanySearchResultModel({
    required super.id,
    super.logoPath,
    required super.name,
    required super.originCountry,
  });

  factory CompanySearchResultModel.fromJson(Map<String, dynamic> json) {
    return CompanySearchResultModel(
      id: json['id'],
      logoPath: json['logo_path'],
      name: json['name'] ?? '',
      originCountry: json['origin_country'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'logo_path': logoPath,
      'name': name,
      'origin_country': originCountry,
    };
  }
}
