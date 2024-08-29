import 'package:chess_onitama/engine/moveset/offset_movement.dart';
import 'package:chess_onitama/engine/pieces/piece.dart';
import 'package:chess_onitama/engine/utilities/position.dart';

class Bishop extends Piece with OffsetMovement {
  Bishop({required super.chess, required super.chessColor}) {
    maxMoves = 7;
    offsets = [
      const Position(-1, -1),
      const Position(-1, 1),
      const Position(1, -1),
      const Position(1, 1),
    ];
  }
}
