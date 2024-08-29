import 'package:chess_onitama/engine/pieces/piece.dart';
import 'package:chess_onitama/engine/utilities/position.dart';

class King extends Piece {
  King({required super.chess, required super.chessColor});

  @override
  // TODO: implement legalMoves
  List<Position> legalMoves(Position from) => throw UnimplementedError();
}
