import 'package:chess_onitama/engine/pieces/piece.dart';
import 'package:chess_onitama/engine/moveset/offset_movement.dart';
import 'package:chess_onitama/engine/utilities/position.dart';

class Queen extends Piece with OffsetMovement {
  Queen({required super.chess, required super.chessColor}) {
    offsets = [
      const Position(-1, 0),
      const Position(0, -1),
      const Position(0, 1),
      const Position(1, 0),
      const Position(-1, -1),
      const Position(-1, 1),
      const Position(1, -1),
      const Position(1, 1),
    ];
  }
}
