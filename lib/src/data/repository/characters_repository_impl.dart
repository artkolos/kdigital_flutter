import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:kdigital_test/src/domain/repository/characters_repository.dart';
import 'package:kdigital_test/src/domain/models/character.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  final Client client;

  CharactersRepositoryImpl(this.client);

  @override
  Future<List<Character>?> getCharacters(int page) async {
    var client = Client();
    final charResult = await client.get(
      Uri.parse("https://rickandmortyapi.com/api/character/?page=$page"),
    );
    final jsonMap = await json.decode(charResult.body) as Map<String, dynamic>;
    return Future.value(
      List.of(
        (jsonMap["results"] as List<dynamic>).map(
          (value) => Character.fromJson(value),
        ),
      ),
    );
  }
}
