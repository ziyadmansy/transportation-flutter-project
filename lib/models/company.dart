import 'package:transportation_flutter_project/shared/api_routes.dart';

class Company {
  int? id;
  CompanyDetails? companyDetails;
  String? materialName;
  String? service;
  double? price;

  Company({
    this.id,
    this.companyDetails,
    this.materialName,
    this.service,
    this.price,
  });

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyDetails = json['company_details'] != null
        ? CompanyDetails.fromJson(json['company_details'])
        : null;
    materialName = json['material_name'];
    service = json['service'];
    price = double.parse(json['price'].toString());
  }
}

class CompanyDetails {
  int id;
  String? name;
  String? logo;
  bool isSeaFreight;
  bool isLandShipping;
  bool isCustomsClearance;

  CompanyDetails({
    required this.id,
    this.name,
    this.logo,
    required this.isSeaFreight,
    required this.isLandShipping,
    required this.isCustomsClearance,
  });

  factory CompanyDetails.fromJson(Map<String, dynamic> json) {
    return CompanyDetails(
      id: json['id'],
      name: json['name'],
      logo: '${ApiRoutes.baseUrl}${json['logo']}',
      isSeaFreight: json['is_sea_freight'],
      isLandShipping: json['is_land_shipping'],
      isCustomsClearance: json['is_customs_clearance'],
    );
  }
}
