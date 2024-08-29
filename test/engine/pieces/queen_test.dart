import 'package:chess_onitama/engine/chess.dart';
import 'package:chess_onitama/engine/utilities/position.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Queen legalMoves without collision', () {
    /// ♔	♕	♖	♗	♘	♙	♚	♛	♜	♝	♞	♟
    var chessboard = [
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '♕', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
    ];

    var chess = Chess.fromUnicode(chessboard);
    Position current = const Position(4, 3);

    var actual = chess.board[current.row][current.col]!.legalMoves(current);
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

  test('Queen legalMoves with collision', () {
    /// ♔	♕	♖	♗	♘	♙	♚	♛	♜	♝	♞	♟
    var chessboard = [
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '♟', '□', '■', '□', '■'],
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '♖', '■', '♕', '■', '□', '♟', '□'],
      ['□', '■', '□', '■', '♘', '■', '□', '■'],
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
    ];

    var chess = Chess.fromUnicode(chessboard);
    Position current = const Position(4, 3);

    var actual = chess.board[current.row][current.col]!.legalMoves(current);
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
      const Position(6, 1),
      const Position(7, 0),
      const Position(1, 3),
      const Position(2, 3),
      const Position(3, 3),
      const Position(4, 2),
      const Position(4, 4),
      const Position(4, 5),
      const Position(4, 6),
      const Position(5, 3),
      const Position(6, 3),
      const Position(7, 3),
    ];
    expected.sort();

    expect(actual, expected);
  });
}
