import 'package:chess_onitama/engine/pieces/piece.dart';
import 'package:chess_onitama/engine/utilities/color.dart';
import 'package:chess_onitama/engine/utilities/position.dart';

class Pawn extends Piece {
  Pawn({required super.chess, required super.chessColor});

  @override
  List<Position> legalMoves(Position from) {
    List<Position> moves = [];
    int direction = chessColor == ChessColor.white ? -1 : 1;

    var newPosition = from + Position(direction * 1, 0);
    var firstIsEmpty = chess.isEmptyAt(newPosition);
    if (firstIsEmpty) {
      moves.add(newPosition);
    }

    newPosition = from + Position(direction * 2, 0);
    if (firstMove && firstIsEmpty && chess.isEmptyAt(newPosition)) {
      moves.add(newPosition);
    }

    var captureOffsets = [
      Position(direction * 1, 1),
      Position(direction * 1, -1),
    ];

    for (var position in captureOffsets) {
      var captureOffset = from + position;
      if (chess.isEmptyAt(captureOffset)) continue;
      if (chess.getPieceAt(captureOffset).chessColor != chessColor) {
        moves.add(captureOffset);
      }
    }

    return moves;
  }

  @override
  String toString() {
    return chessColor == ChessColor.white ? '♙' : '♟';
  }
}
