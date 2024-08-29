import 'package:chess_onitama/engine/pieces/piece.dart';
import 'package:chess_onitama/engine/moveset/movement.dart';
import 'package:chess_onitama/engine/utilities/position.dart';

class Queen extends Piece {
  Queen({required super.chess, required super.chessColor});

  @override
  List<Position> legalMoves(Position from) {
    throw UnimplementedError();
  }

  @override
  MovementKind evaluateMovement(Position position,
      {required MovementKind current}) {
    // TODO: implement evaluateMovement
    throw UnimplementedError();
  }
}
