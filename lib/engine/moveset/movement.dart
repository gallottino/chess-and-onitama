import 'package:chess_onitama/engine/chess.dart';
import 'package:chess_onitama/engine/pieces/piece.dart';
import 'package:chess_onitama/engine/utilities/color.dart';
import 'package:chess_onitama/engine/utilities/position.dart';

enum MovementKind { start, move, capture, stop }

abstract class Movement {
  final Chess chess;
  final ChessColor chessColor;

  bool firstMove;

  Movement(
      {required this.chess, required this.chessColor, this.firstMove = true});

  List<Position> legalMoves(Position from);

  Piece? move(Position from, Position to) {
    if (legalMoves(from).contains(to)) {
      firstMove = false;
      var capturePiece = chess.board[to.row][to.col];
      chess.board[to.row][to.col] = chess.board[from.row][from.col];
      chess.board[from.row][from.col] = null;

      return capturePiece;
    }

    return null;
  }
}
