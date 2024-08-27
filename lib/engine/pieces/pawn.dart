import 'package:chess_onitama/engine/pieces/piece.dart';
import 'package:chess_onitama/engine/moveset/movement.dart';
import 'package:chess_onitama/engine/utilities/position.dart';

class Pawn extends Piece {
  Pawn({required super.chess, required super.chessColor});

  @override
  List<Position> legalMoves(Position from) {
    throw UnimplementedError();
  }

  @override
  Movement evaluateMovement(Position position, {required Movement current}) {
    // TODO: implement evaluateMovement
    throw UnimplementedError();
  }
}
