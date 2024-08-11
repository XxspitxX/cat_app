abstract class ApiPaths {
  ApiPaths._();
  static const _apiKey =
      'ive_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr';
  static const _baseApi = 'https://api.thecatapi.com/v1/';
  static const apiSearch = '${_baseApi}images/search?has_breeds=true&limit=10';
  static String apiSearchBreed(String id) => '${_baseApi}images/$id';

  static const headers = {
    'Content-Type': 'application/json',
    'x-api-key': _apiKey
  };
}
