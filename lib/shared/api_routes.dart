class ApiRoutes {
  static const String baseUrl = 'http://10.0.2.2:8000';

  static const String apiUrl = '$baseUrl/api';

  static const String login = '$apiUrl/login';
  static const String consumerRegister = '$apiUrl/consumer-register';
  static const String companyRegister = '$apiUrl/company-register';
  static const String systemMaterial = '$apiUrl/materils';

  // Company APIs

  // Consumer
  static const String companiesList = '$apiUrl/companies';
  static const String createOrder = '$apiUrl/order';
  static String consumerOrders(int uid) => '$apiUrl/consumer-orders/$uid';
}
