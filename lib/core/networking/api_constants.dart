class ApiConstants {
  static const String baseUrl = 'https://api.thecatapi.com/';
  static const String apiKey =
      'live_7VOsy3YoXzeodGKllqPqY7gZFcNDORojTV87sEvOWpsK4zO033RUVUvU0GruDpzG';
  static const String breeds = 'v1/breeds?limit=20&page=0&api_key=$apiKey';
  static const String favroite = 'v1/favourites';

  static const String images = 'v1/images';

  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const String contentType = 'application/json';
  static const String accept = 'application/json';
}
