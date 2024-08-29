import 'package:chess_onitama/engine/chess.dart';
import 'package:chess_onitama/engine/utilities/position.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Knight legalMoves withou collision', () {
    /// ♔	♕	♖	♗	♘	♙	♚	♛	♜	♝	♞	♟
    var chessboard = [
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '♘', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
    ];

    var chess = Chess.fromUnicode(chessboard);
    Position current = const Position(4, 3);
    var actual = chess.board[current.row][current.col]!.legalMoves(current);
    actual.sort();

    var expected = [
      const Position(2, 2),
      const Position(2, 4),
      const Position(3, 1),
      const Position(3, 5),
      const Position(5, 1),
      const Position(5, 5),
      const Position(6, 2),
      const Position(6, 4),
    ];
    expected.sort();

    expect(actual, expected);
  });

  test('Knight legalMoves with collision', () {
    /// ♔	♕	♖	♗	♘	♙	♚	♛	♜	♝	♞	♟
    var chessboard = [
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '♖', '□', '■', '□', '■', '□'],
      ['□', '♔', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '♘', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '♛', '□', '■'],
      ['■', '□', '■', '□', '♜', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
    ];

    var chess = Chess.fromUnicode(chessboard);
    Position current = const Position(4, 3);
    var actual = chess.board[current.row][current.col]!.legalMoves(current);
    actual.sort();

    var expected = [
      const Position(2, 4),
      const Position(3, 5),
      const Position(5, 1),
      const Position(5, 5),
      const Position(6, 2),
      const Position(6, 4),
    ];
    expected.sort();

    expect(actual, expected);
  });
}
