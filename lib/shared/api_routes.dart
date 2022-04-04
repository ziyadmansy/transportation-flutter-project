import 'package:transportation_flutter_project/shared/shared_widgets.dart';

class ApiRoutes {
  static const String baseUrl = 'http://18.198.107.110';
  // static const String baseUrl = 'http://10.0.2.2:8000';

  static const String apiUrl = '$baseUrl/shipping/api';

  static const String login = '$apiUrl/login';
  static const String consumerRegister = '$apiUrl/consumer-register';
  static const String companyRegister = '$apiUrl/company-register';
  static const String systemMaterial = '$apiUrl/materils';

  // Company APIs
  static String companyOrders = '$apiUrl/company-orders/${SharedWidgets.uid}';
  static String companyDetails = '$apiUrl/company/${SharedWidgets.uid}';
  static String addCompanyPrices = '$apiUrl/company-prices';
  static String getCompanyPrices =
      '$apiUrl/company-prices/${SharedWidgets.uid}';
  static String deleteCompanyPrices(int itemId) =>
      '$apiUrl/company-prices/$itemId';

  // Consumer
  static const String companiesList = '$apiUrl/companies';
  static const String createOrder = '$apiUrl/order';
  static String consumerOrders = '$apiUrl/consumer-orders/${SharedWidgets.uid}';
}
