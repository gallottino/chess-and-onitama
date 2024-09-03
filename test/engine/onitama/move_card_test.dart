import 'dart:convert';
import 'dart:io';
import 'package:chess_onitama/engine/pieces/onitama/move_card.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Load Move Card from json', () async {
    final file = File('assets/move_cards.json');
    final json = jsonDecode(await file.readAsString());

    List<dynamic> moveCards = [];
    for (var moveCard in json["cards"]) {
      moveCards.add(MoveCard.fromJson(moveCard));
    }

    expect(moveCards.length, 16);
    var names = [
      "Tiger",
      "Crab",
      "Monkey",
      "Crane",
      "Dragon",
      "Elephant",
      "Mantis",
      "Boar",
      "Frog",
      "Goose",
      "Horse",
      "Eel",
      "Rabbit",
      "Rooster",
      "Ox",
      "Cobra",
    ];

    for (var card in moveCards) {
      expect(names.contains(card.name), true);
      names.remove(card.name);
    }
  });
}
