import 'package:flutter/material.dart';
import 'package:rickandmortyapp/home/models/character.dart';
import 'package:rickandmortyapp/home/screens/widgets/display-image.dart';

class CharacterCard extends StatelessWidget {
  final CharacterDTO character;
  const CharacterCard({Key key, @required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 2,
                  offset: Offset(0, 2))
            ]),
        child: Row(children: [
          DisplayImage(urlImage: character.image ?? ""),
          _buildingCharacterInformation(context, character)
        ]));
  }

  Widget _buildingCharacterInformation(
      BuildContext context, CharacterDTO character) {
    return Expanded(
        child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          Text(character.name ?? " ",
              style: TextStyle(
                fontSize: 17,
                color: Colors.black.withOpacity(0.8),
              ),
              softWrap: true),
          SizedBox(height: 3),
          Text(
            character.species ?? " ",
            style: TextStyle(
              fontSize: 17,
              color: Colors.black.withOpacity(0.6),
            ),
            softWrap: true,
          ),
          SizedBox(height: 3),
          Text(
            character.status ?? " ",
            style: TextStyle(
              fontSize: 17,
              color: Colors.black.withOpacity(0.6),
            ),
            softWrap: true,
          ),
        ])));
  }
}
