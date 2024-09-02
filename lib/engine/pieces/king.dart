import 'package:chess_onitama/engine/moveset/offset_movement.dart';
import 'package:chess_onitama/engine/pieces/piece.dart';
import 'package:chess_onitama/engine/utilities/color.dart';
import 'package:chess_onitama/engine/utilities/position.dart';

class King extends Piece with OffsetMovement {
  King({required super.chess, required super.chessColor}) {
    maxMoves = 1;
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

  @override
  String toString() {
    return chessColor == ChessColor.white ? '♔' : '♚';
  }
}
