import 'package:chess_onitama/engine/moveset/offset_movement.dart';
import 'package:chess_onitama/engine/pieces/piece.dart';
import 'package:chess_onitama/engine/utilities/position.dart';

class Knight extends Piece with OffsetMovement {
  Knight({required super.chess, required super.chessColor}) {
    maxMoves = 1;
    offsets = [
      const Position(-2, -1),
      const Position(-2, 1),
      const Position(-1, -2),
      const Position(-1, 2),
      const Position(1, -2),
      const Position(1, 2),
      const Position(2, -1),
      const Position(2, 1),
    ];
  }
}
