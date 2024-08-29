import 'package:chess_onitama/engine/moveset/movement.dart';
import 'package:chess_onitama/engine/utilities/position.dart';

mixin OffsetMovement implements Movement {

  List<Position>? offsets;

  @override
  List<Position> legalMoves(Position from) {
    
    if(offsets == null) {
      throw UnimplementedError('Offsets are not set for this piece');
    }

    var (row, col) = from.values;
    var legalMoves = <Position>[];

    List<MovementKind> movements = List.filled(offsets!.length, MovementKind.start);

    for(var index = 0; index < offsets!.length; index++) {
      for (var i = 1; i < 8; i++) {

        var (rowOffset, colOffset) = offsets![index].values;
        var newPosition = Position(row + rowOffset * i, col + colOffset * i);
        
        movements[index] = evaluateMovement(current: movements[index], newPosition);
        if (movements[index] != MovementKind.stop) {
          legalMoves.add(newPosition);
        }
      }
    }

    return legalMoves;
  }
}