import 'package:flutter/material.dart';
import 'package:rickandmortyapp/home/controllers/home-controller.dart';
import 'package:rickandmortyapp/home/models/character.dart';
import 'package:rickandmortyapp/home/screens/widgets/characters-card.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rick & Morty APP"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: getCharacters(),
          ),
        ),
      ),
    );
  }

  FutureBuilder<List<CharacterDTO>> getCharacters() =>
      FutureBuilder<List<CharacterDTO>>(
          future: homecontroller.getCharacters(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container(
                height: 300,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            final List<CharacterDTO> characters = snapshot.data;
            final bool characterCounter = characters.length > 0;
            if (characterCounter) {
              return _buildMyCharacters(characters);
            } else {
              return Container();
            }
          });

  Widget _buildMyCharacters(List<CharacterDTO> characters) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: characters.length,
        itemBuilder: (context, index) =>
            CharacterCard(character: characters[index]));
  }
}
