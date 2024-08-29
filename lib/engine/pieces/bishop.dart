import 'package:chess_onitama/engine/moveset/offset_movement.dart';
import 'package:chess_onitama/engine/pieces/piece.dart';
import 'package:chess_onitama/engine/moveset/movement.dart';
import 'package:chess_onitama/engine/utilities/position.dart';

class Bishop extends Piece with OffsetMovement{
  Bishop({required super.chess, required super.chessColor}) {
    offsets = [
      const Position(-1, -1),
      const Position(-1, 1),
      const Position(1, -1),
      const Position(1, 1),
    ];
  }

  @override
  MovementKind evaluateMovement(Position newPosition, {required MovementKind current}) {
    if (current == MovementKind.stop || current == MovementKind.capture) {
      return MovementKind.stop;
    }

    var (row, col) = newPosition.values;
    if (row < 0 || row >= 8 || col < 0 || col >= 8) {
      return MovementKind.stop;
    }

    Piece? piece = chess.getPiece((row, col));
    if (piece != null) {
      if (piece.chessColor == chessColor) {
        return MovementKind.stop;
      } else {
        return MovementKind.capture;
      }
    }
    return MovementKind.move;
  }
}
