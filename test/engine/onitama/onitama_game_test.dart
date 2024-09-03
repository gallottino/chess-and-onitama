import 'package:chess_onitama/engine/onitama.dart';
import 'package:chess_onitama/engine/pieces/onitama/move_card.dart';
import 'package:chess_onitama/engine/utilities/color.dart';
import 'package:chess_onitama/engine/utilities/position.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var initCards = [
    const MoveCard(name: 'Tiger', kanji: "虎", offsets: [
      Position(-1, 0),
    ]),
    const MoveCard(name: 'Crab', kanji: "蟹", offsets: [
      Position(-1, 0),
    ]),
    const MoveCard(name: 'Crane', kanji: "鶴", offsets: [
      Position(-1, 0),
    ]),
    const MoveCard(name: 'Frog', kanji: "蛙", offsets: [
      Position(-1, 0),
    ]),
    const MoveCard(name: 'Goose', kanji: "雁", offsets: [
      Position(-1, 0),
    ]),
  ];

  test('Select a Card', () {
    Onitama onitama = Onitama.init(moveCards: [...initCards]);
    onitama.selectCard(0);
    expect(onitama.selectedCard, onitama.playerCards[onitama.turn]![0]);
  });

  test('Move a Piece', () {
    // Create a new Onitama game
    Onitama onitama = Onitama.init(moveCards: [...initCards]);
    onitama.selectCard(0);
    var selectedName = onitama.selectedCard!.name;
    var nextName = onitama.nextCard!.name;

    onitama.selectedPos = const Position(0, 0);
    expect(onitama.moveAt(const Position(1, 0)) == true, true);

    expect(onitama.turn, ChessColor.black);
    expect(onitama.nextCard!.name, selectedName);

    expect(
        onitama.playerCards[ChessColor.white]!
            .map((card) => card.name)
            .toList()
            .contains(nextName),
        true);
  });

  test('Capture a Piece', () {});
}
