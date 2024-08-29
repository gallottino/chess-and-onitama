import 'package:chess_onitama/engine/pieces/piece.dart';
import 'package:chess_onitama/engine/utilities/position.dart';

class Pawn extends Piece {
  Pawn({required super.chess, required super.chessColor});

  @override
  List<Position> legalMoves(Position from) {
    throw UnimplementedError();
  }
}
