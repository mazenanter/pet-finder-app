class ApiConstants {
  static const String baseUrl = 'https://api.thecatapi.com/';
  static const String breeds =
      'v1/breeds?limit=1&page=0&api_key=live_7VOsy3YoXzeodGKllqPqY7gZFcNDORojTV87sEvOWpsK4zO033RUVUvU0GruDpzG';

  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const String contentType = 'application/json';
  static const String accept = 'application/json';
}
