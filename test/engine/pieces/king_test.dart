import 'package:chess_onitama/engine/chess.dart';
import 'package:chess_onitama/engine/utilities/position.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('King legalMoves without collision', (){
    /// ♔	♕	♖	♗	♘	♙	♚	♛	♜	♝	♞	♟
    var chessboard = [
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '♔', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
    ];

    var chess = Chess.fromUnicode(chessboard);
    Position current = const Position(4, 3);
    var actual = chess.board[current.row][current.col]!.legalMoves(current);
    actual.sort();

    var expected = [
      const Position(3, 2),
      const Position(3, 3),
      const Position(3, 4),
      const Position(4, 2),
      const Position(4, 4),
      const Position(5, 2),
      const Position(5, 3),
      const Position(5, 4),
    ];
    expected.sort();

    expect(actual, expected);
    
  });

  test('King legalMoves with collision', (){
    /// ♔	♕	♖	♗	♘	♙	♚	♛	♜	♝	♞	♟
    var chessboard = [
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '♙', '■', '♜', '■', '□', '■'],
      ['■', '□', '♖', '♔', '♝', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
    ];

    var chess = Chess.fromUnicode(chessboard);
    Position current = const Position(4, 3);
    var actual = chess.board[current.row][current.col]!.legalMoves(current);
    actual.sort();

    var expected = [
      const Position(3, 3),
      const Position(3, 4),
      const Position(4, 4),
      const Position(5, 2),
      const Position(5, 3),
      const Position(5, 4),
    ];
    expected.sort();

    expect(actual, expected);
  });
}