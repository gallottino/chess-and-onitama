import 'package:chess_onitama/engine/chess.dart';
import 'package:chess_onitama/engine/pieces/bishop.dart';
import 'package:chess_onitama/engine/pieces/king.dart';
import 'package:chess_onitama/engine/pieces/knight.dart';
import 'package:chess_onitama/engine/pieces/pawn.dart';
import 'package:chess_onitama/engine/pieces/queen.dart';
import 'package:chess_onitama/engine/pieces/rook.dart';
import 'package:chess_onitama/engine/utilities/color.dart';
import 'package:chess_onitama/engine/moveset/movement.dart';
import 'package:chess_onitama/engine/utilities/position.dart';

abstract class Piece {
  final Chess chess;
  final ChessColor chessColor;

  const Piece({required this.chess, required this.chessColor});

  List<Position> legalMoves(Position from);

  factory Piece.fromUnicode(String piece, Chess board) {
    Map<String, Function> pieces = {
      '♔': () => King(chessColor: ChessColor.white, chess: board),
      '♚': () => King(chessColor: ChessColor.black, chess: board),
      '♕': () => Queen(chessColor: ChessColor.white, chess: board),
      '♛': () => Queen(chessColor: ChessColor.black, chess: board),
      '♖': () => Rook(chessColor: ChessColor.white, chess: board),
      '♜': () => Rook(chessColor: ChessColor.black, chess: board),
      '♘': () => Knight(chessColor: ChessColor.white, chess: board),
      '♞': () => Knight(chessColor: ChessColor.black, chess: board),
      '♗': () => Bishop(chessColor: ChessColor.white, chess: board),
      '♝': () => Bishop(chessColor: ChessColor.black, chess: board),
      '♙': () => Pawn(chessColor: ChessColor.white, chess: board),
      '♟': () => Pawn(chessColor: ChessColor.black, chess: board),
    };

    var newPiece = pieces[piece];
    if (newPiece == null) {
      throw Exception('Invalid Unicode');
    }

    return newPiece.call();
  }

  Movement evaluateMovement(Position position, {required Movement current});
}
