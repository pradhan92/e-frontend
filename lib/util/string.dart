import 'package:http/http.dart' as http;

class AppString{
  static String baseURL = "http://127.0.0.1:8000/api";
  static var client = http.Client();
}