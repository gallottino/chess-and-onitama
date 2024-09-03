import 'package:chess_onitama/engine/chess.dart';
import 'package:chess_onitama/engine/pieces/chess/bishop.dart';
import 'package:chess_onitama/engine/pieces/chess/king.dart';
import 'package:chess_onitama/engine/pieces/chess/knight.dart';
import 'package:chess_onitama/engine/pieces/chess/pawn.dart';
import 'package:chess_onitama/engine/pieces/chess/queen.dart';
import 'package:chess_onitama/engine/pieces/chess/rook.dart';
import 'package:chess_onitama/engine/utilities/color.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Empty chessboard from Unicode', () {
    var chessboard = [
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
      ['■', '□', '■', '□', '■', '□', '■', '□'],
      ['□', '■', '□', '■', '□', '■', '□', '■'],
    ];

    var chess = Chess.fromUnicode(chessboard);

    for (var row in chess.board) {
      for (var piece in row) {
        expect(piece == null, true);
      }
    }
  });

  test('Full chessboard from Unicode', () {
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

    for (int col = 0; col < 8; col++) {
      expect(chess.board[1][col] is Pawn, true);
      expect(chess.board[1][col]!.chessColor, ChessColor.black);

      expect(chess.board[6][col] is Pawn, true);
      expect(chess.board[6][col]!.chessColor, ChessColor.white);
    }

    expect(chess.board[0][0] is Rook, true);
    expect(chess.board[0][0]!.chessColor, ChessColor.black);
    expect(chess.board[0][1] is Knight, true);
    expect(chess.board[0][1]!.chessColor, ChessColor.black);
    expect(chess.board[0][2] is Bishop, true);
    expect(chess.board[0][2]!.chessColor, ChessColor.black);
    expect(chess.board[0][3] is Queen, true);
    expect(chess.board[0][3]!.chessColor, ChessColor.black);
    expect(chess.board[0][4] is King, true);
    expect(chess.board[0][4]!.chessColor, ChessColor.black);
    expect(chess.board[0][5] is Bishop, true);
    expect(chess.board[0][5]!.chessColor, ChessColor.black);
    expect(chess.board[0][6] is Knight, true);
    expect(chess.board[0][6]!.chessColor, ChessColor.black);
    expect(chess.board[0][7] is Rook, true);
    expect(chess.board[0][7]!.chessColor, ChessColor.black);

    expect(chess.board[7][0] is Rook, true);
    expect(chess.board[7][0]!.chessColor, ChessColor.white);
    expect(chess.board[7][1] is Knight, true);
    expect(chess.board[7][1]!.chessColor, ChessColor.white);
    expect(chess.board[7][2] is Bishop, true);
    expect(chess.board[7][2]!.chessColor, ChessColor.white);
    expect(chess.board[7][3] is Queen, true);
    expect(chess.board[7][3]!.chessColor, ChessColor.white);
    expect(chess.board[7][4] is King, true);
    expect(chess.board[7][4]!.chessColor, ChessColor.white);
    expect(chess.board[7][5] is Bishop, true);
    expect(chess.board[7][5]!.chessColor, ChessColor.white);
    expect(chess.board[7][6] is Knight, true);
    expect(chess.board[7][6]!.chessColor, ChessColor.white);
    expect(chess.board[7][7] is Rook, true);
    expect(chess.board[7][7]!.chessColor, ChessColor.white);
  });
}
