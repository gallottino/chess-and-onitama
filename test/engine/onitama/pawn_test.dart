import 'package:chess_onitama/engine/onitama.dart';
import 'package:chess_onitama/engine/pieces/onitama/move_card.dart';
import 'package:chess_onitama/engine/pieces/onitama/pawn.dart';
import 'package:chess_onitama/engine/utilities/color.dart';
import 'package:chess_onitama/engine/utilities/position.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Pawn with MoveCard', () {
    MoveCard tiger = const MoveCard(name: 'Tiger', kanji: "虎", offsets: [
      Position(-2, 0),
      Position(1, 0),
    ]);

    Onitama onitama = Onitama.init();
    var studentPawn = onitama.board[2][0] =
        Pawn(chess: onitama, chessColor: ChessColor.white);
    studentPawn.moveCard = tiger;

    var result = studentPawn.legalMoves(const Position(2, 0));
    result.sort();

    var expected = [
      const Position(0, 0),
      const Position(3, 0),
    ];
    expect(result, expected);
  });

  test('Pawn without MoveCard', () {
    Onitama onitama = Onitama.init();
    var studentPawn = onitama.board[2][0] =
        Pawn(chess: onitama, chessColor: ChessColor.white);

    var result = studentPawn.legalMoves(const Position(2, 0));
    result.sort();

    var expected = [];
    expect(result, expected);
  });
}
