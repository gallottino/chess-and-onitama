import 'package:chess_onitama/engine/chess.dart';
import 'package:chess_onitama/engine/utilities/position.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Rook legalMoves without collision', () {
    /// ♔	♕	♖	♗	♘	♙	♚	♛	♜	♝	♞	♟
    var chessboard = [
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '♜', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
    ];

    var chess = Chess.fromUnicode(chessboard);

    var actual = chess.board[4][3]!.legalMoves(const Position(4, 3));
    actual.sort();

    var expected = [
      const Position(0, 3),
      const Position(1, 3),
      const Position(2, 3),
      const Position(3, 3),
      const Position(4, 0),
      const Position(4, 1),
      const Position(4, 2),
      const Position(4, 4),
      const Position(4, 5),
      const Position(4, 6),
      const Position(4, 7),
      const Position(5, 3),
      const Position(6, 3),
      const Position(7, 3),
    ];
    expected.sort();

    expect(actual, expected);
  });

  test('Rook legalMoves with collision', () {
    /// ♔	♕	♖	♗	♘	♙	♚	♛	♜	♝	♞	♟
    var chessboard = [
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '♗', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '♜', '♝', '□', '■', '□', '■'],
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
    ];

    var chess = Chess.fromUnicode(chessboard);

    var actual = chess.board[5][2]!.legalMoves(const Position(5, 2));
    actual.sort();

    var expected = [
      const Position(2, 2),
      const Position(3, 2),
      const Position(4, 2),
      const Position(5, 0),
      const Position(5, 1),
      const Position(6, 2),
      const Position(7, 2)
    ];
    expected.sort();

    expect(actual, expected);
  });
}
