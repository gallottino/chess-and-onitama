import 'package:chess_onitama/engine/moveset/movement.dart';
import 'package:chess_onitama/engine/pieces/piece.dart';
import 'package:chess_onitama/engine/utilities/position.dart';

mixin OffsetMovement implements Movement {
  List<Position>? offsets;
  int? maxMoves;

  @override
  List<Position> legalMoves(Position from) {
    if (offsets == null) {
      throw UnimplementedError('Offsets are not set for this piece');
    }

    if(maxMoves == null) {
      throw UnimplementedError('Max moves are not set for this piece');
    }
    
    var (row, col) = from.values;
    var legalMoves = <Position>[];

    List<MovementKind> movements =
        List.filled(offsets!.length, MovementKind.start);

    for (var index = 0; index < offsets!.length; index++) {
      for (var i = 1; i <= maxMoves!; i++) {
        var (rowOffset, colOffset) = offsets![index].values;
        var newPosition = Position(row + rowOffset * i, col + colOffset * i);

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
