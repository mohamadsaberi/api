import 'package:http/http.dart' as http;

class ApiService {
  Future<String> fetchExampleText() async {
    final response = await http.get(Uri.parse('YOUR_API_ENDPOINT'));
    if (response.statusCode == 200) {
      return response.body; // Assuming the response body contains the text
    } else {
      throw Exception('Failed to load example text');
    }
  }
}