import 'package:flutter/material.dart';
import 'package:kdigital_test/src/domain/models/character.dart';

class CharactersWidget extends StatelessWidget {
  const CharactersWidget({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: ShapeDecoration(
          color: const Color.fromARGB(120, 204, 255, 255),
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              character.image,
              width: 50,
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 230,
                    child: Text(
                      character.name,
                      maxLines: 2,
                    ),
                  ),
                  Text(character.gender),
                  Text(character.species),
                  Text(character.status),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
