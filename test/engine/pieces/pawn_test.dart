import 'package:chess_onitama/engine/chess.dart';
import 'package:chess_onitama/engine/utilities/position.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('White pawn legalMoves without collision', () {
    /// ♔	♕	♖	♗	♘	♙	♚	♛	♜	♝	♞	♟
    var chessboard = [
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '♙', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
    ];

    Chess chess = Chess.fromUnicode(chessboard);
    Position current = const Position(6, 3);
    var actual = chess.getPieceAt(current).legalMoves(current);
    actual.sort();

    var expected = [const Position(5, 3), const Position(4, 3)];
    expected.sort();

    expect(actual, expected);
  });

  test('White pawn legalMoves with collision', () {
    /// ♔	♕	♖	♗	♘	♙	♚	♛	♜	♝	♞	♟
    var chessboard = [
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '♟', '□', '■', '□', '■'],
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '♜', '■', '♖', '■', '□', '■'],
      ['■', '□', '■', '♙', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
    ];

    Chess chess = Chess.fromUnicode(chessboard);
    Position current = const Position(6, 3);
    var actual = chess.getPieceAt(current).legalMoves(current);
    actual.sort();

    var expected = [
      const Position(4, 3),
      const Position(5, 2),
      const Position(5, 3),
    ];
    expected.sort();

    expect(actual, expected);
  });

  test('Black pawn legalMoves without collision', () {
    /// ♔	♕	♖	♗	♘	♙	♚	♛	♜	♝	♞	♟
    var chessboard = [
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '♟', '□', '■', '□', '■'],
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
    ];

    Chess chess = Chess.fromUnicode(chessboard);
    Position current = const Position(1, 3);
    var actual = chess.getPieceAt(current).legalMoves(current);
    actual.sort();

    var expected = [
      const Position(2, 3),
      const Position(3, 3),
    ];
    expected.sort();

    expect(actual, expected);
  });

  test('Black pawn legalMoves with collision', () {
    /// ♔	♕	♖	♗	♘	♙	♚	♛	♜	♝	♞	♟
    var chessboard = [
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '♟', '□', '■', '□', '■'],
      ['■', '□', '♜', '□', '♖', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
    ];

    Chess chess = Chess.fromUnicode(chessboard);
    Position current = const Position(1, 3);
    var actual = chess.getPieceAt(current).legalMoves(current);
    actual.sort();

    var expected = [
      const Position(2, 3),
      const Position(2, 4),
      const Position(3, 3),
    ];
    expected.sort();

    expect(actual, expected);
  });

  test('External pawn capture border', (){
    /// ♔	♕	♖	♗	♘	♙	♚	♛	♜	♝	♞	♟
    var chessboard = [
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '♜', '■', '♖', '■', '□', '■'],
      ['♙', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
    ];

    Chess chess = Chess.fromUnicode(chessboard);
    Position current = const Position(6, 0);
    var actual = chess.getPieceAt(current).legalMoves(current);
    actual.sort();

    var expected = [
      const Position(4, 0),
      const Position(5, 0),
    ];
    expected.sort();

    expect(actual, expected);
  });
}
