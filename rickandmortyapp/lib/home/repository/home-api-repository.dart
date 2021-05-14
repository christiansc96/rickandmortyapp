import 'package:http/http.dart' as http;

class HomeApiRepository {
  final String api = "https://rickandmortyapi.com/api/";

  Future<http.Response> getCharacters() async {
    return await http.get("${api}character", headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
  }
}
