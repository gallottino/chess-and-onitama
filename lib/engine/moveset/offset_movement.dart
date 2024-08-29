import 'package:chess_onitama/engine/moveset/movement.dart';
import 'package:chess_onitama/engine/pieces/piece.dart';
import 'package:chess_onitama/engine/utilities/position.dart';

mixin OffsetMovement implements Movement {
  List<Position>? offsets;
  int? maxMoves;

  @override
  List<Position> legalMoves(Position from) {
    if (offsets == null) {
      throw UnimplementedError('field "offsets" is not set for this piece');
    }

    if (maxMoves == null) {
      throw UnimplementedError('field "maxMoves" is not set for this piece');
    }

    var legalMoves = <Position>[];

    List<MovementKind> movements =
        List.filled(offsets!.length, MovementKind.start);

    for (var index = 0; index < offsets!.length; index++) {
      for (var currentMove = 1; currentMove <= maxMoves!; currentMove++) {
        var offset = offsets![index] * currentMove;
        var newPosition = from + offset;

        movements[index] =
            evaluateMovement(current: movements[index], newPosition);
        if (movements[index] != MovementKind.stop) {
          legalMoves.add(newPosition);
        }
      }
    }

    return legalMoves;
  }

  MovementKind evaluateMovement(Position newPosition,
      {required MovementKind current}) {
    if (current == MovementKind.stop || current == MovementKind.capture) {
      return MovementKind.stop;
    }

    var (row, col) = newPosition.values;
    if (row < 0 || row >= 8 || col < 0 || col >= 8) {
      return MovementKind.stop;
    }

    if (chess.isEmptyAt(newPosition)) {
      return MovementKind.move;
    }

    Piece piece = chess.getPieceAt(newPosition);
    if (piece.chessColor != chessColor) {
      return MovementKind.capture;
    }

    return MovementKind.stop;
  }
}
