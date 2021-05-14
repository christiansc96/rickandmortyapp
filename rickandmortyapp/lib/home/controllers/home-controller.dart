import 'dart:convert';
import 'package:http/http.dart';
import 'package:rickandmortyapp/home/models/character.dart';
import 'package:rickandmortyapp/home/repository/home-api-repository.dart';

class HomeController {
  final homeApiRepository = HomeApiRepository();

  Future<List<CharacterDTO>> getCharacters() async {
    final Response response = await homeApiRepository.getCharacters();
    List<CharacterDTO> characters = [];

    final bool validateStatusCode = response.statusCode == 200;
    if (validateStatusCode) {
      final dataFromAPI = jsonDecode(response.body);
      final List<dynamic> charactersResults = dataFromAPI["results"];

      characters = charactersResults
          .map((character) => CharacterDTO.fromJson(character))
          .toList();
    }
    return characters;
  }
}

final homecontroller = HomeController();
