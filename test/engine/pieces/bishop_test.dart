import 'package:chess_onitama/engine/chess.dart';
import 'package:chess_onitama/engine/utilities/position.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Bishop legalMoves without collision', () {
    /// ♔	♕	♖	♗	♘	♙	♚	♛	♜	♝	♞	♟
    var chessboard = [
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '♝', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
    ];

    var chess = Chess.fromUnicode(chessboard);

    var actual = chess.board[4][3]!.legalMoves(const Position(4, 3));
    actual.sort();

    var expected = [
      const Position(0, 7),
      const Position(1, 0),
      const Position(1, 6),
      const Position(2, 1),
      const Position(2, 5),
      const Position(3, 2),
      const Position(3, 4),
      const Position(5, 2),
      const Position(5, 4),
      const Position(6, 1),
      const Position(6, 5),
      const Position(7, 0),
      const Position(7, 6),
    ];
    expected.sort();

    expect(actual, expected);
  });

  test('Bishop legalMoves without collision', () {
    /// ♔	♕	♖	♗	♘	♙	♚	♛	♜	♝	♞	♟
    var chessboard = [
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '♗', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '♝', '■', '□', '■', '□'],
      ['□', '■', '♜', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
    ];

    var chess = Chess.fromUnicode(chessboard);

    var actual = chess.board[4][3]!.legalMoves(const Position(4, 3));
    actual.sort();

    var expected = [
      const Position(0, 7),
      const Position(1, 6),
      const Position(2, 1),
      const Position(2, 5),
      const Position(3, 2),
      const Position(3, 4),
      const Position(5, 4),
      const Position(6, 5),
      const Position(7, 6),
    ];
    expected.sort();

    expect(actual, expected);
  });
}
