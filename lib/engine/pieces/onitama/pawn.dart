import 'package:chess_onitama/engine/moveset/offset_movement.dart';
import 'package:chess_onitama/engine/pieces/onitama/move_card.dart';
import 'package:chess_onitama/engine/pieces/piece.dart';
import 'package:chess_onitama/engine/utilities/color.dart';
import 'package:chess_onitama/engine/utilities/position.dart';

class Pawn extends Piece with OffsetMovement {
  final bool isMaster;
  MoveCard? moveCard;

  Pawn(
      {this.isMaster = false,
      required super.chess,
      required super.chessColor}) {
    maxMoves = 1;
  }

  bool get reversed => ChessColor.black == chessColor;

  @override
  List<Position> legalMoves(Position from) {
    if (moveCard == null) {
      return [];
    }

    var direction = reversed ? -1 : 1;

    offsets = moveCard!.offsets.map((offset) {
      return offset * direction;
    }).toList();

    return super.legalMoves(from);
  }

  @override
  String toString() {
    return isMaster
        ? chessColor == ChessColor.white
            ? '♔'
            : '♚'
        : chessColor == ChessColor.white
            ? '♙'
            : '♟';
  }
}
