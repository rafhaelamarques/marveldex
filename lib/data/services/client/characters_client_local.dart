import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:marveldex/data/model/character.dart';
import 'package:marveldex/data/services/client/characters_client_interface.dart';

class CharactersClientLocal implements CharactersClientInterface {
  @override
  Future<List<Character>> getCharacters({int offset = 0}) async {
    final String response = await rootBundle.loadString(
      'assets/response/data.json',
    );

    final data = await json.decode(response);
    return data['data']['results']
        .map<Character>((e) => Character.fromJson(e))
        .toList();
  }

  @override
  Future<Character?> getCharacterById(int id) async {
    final String response = await rootBundle.loadString(
      'assets/response/data.json',
    );

    final data = json.decode(response);
    return data['data']['results']
        .map<Character>((e) => Character.fromJson(e))
        .firstWhere((element) => element.id == id, orElse: () => null);
  }
}
