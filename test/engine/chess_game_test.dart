import 'package:chess_onitama/engine/chess.dart';
import 'package:chess_onitama/engine/utilities/position.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Chess game loop', () {
    var chessboard = [
      ['♜', '♞', '♝', '♛', '♚', '♝', '♞', '♜'],
      ['♟', '♟', '♟', '♟', '♟', '♟', '♟', '♟'],
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['♙', '♙', '♙', '♙', '♙', '♙', '♙', '♙'],
      ['♖', '♘', '♗', '♕', '♔', '♗', '♘', '♖'],
    ];

    var chess = Chess.fromUnicode(chessboard);
    var currentPos = const Position(6, 3);
    var newPosition = const Position(4, 3);
    expect(chess.selectPieceAt(currentPos), true);
    expect(chess.selectedPos, currentPos);
    expect(chess.moveAt(newPosition), true);
    expect(chess.selectedPos, null);
    expect(chess.isEmptyAt(currentPos), true);
    expect(chess.getPieceAt(newPosition).firstMove, false);

    currentPos = const Position(1, 4);
    newPosition = const Position(3, 4);
    chess.selectPieceAt(currentPos);
    expect(chess.moveAt(newPosition), true);
    expect(chess.getPieceAt(newPosition).firstMove, false);

    currentPos = const Position(4, 3);
    newPosition = const Position(3, 4);
    chess.selectPieceAt(currentPos);
    chess.moveAt(newPosition);
    expect(chess.capturedPieces.length, 1);
  });
}
