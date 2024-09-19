import 'dart:collection';

import 'package:chess_onitama/engine/moveset/movement.dart';
import 'package:chess_onitama/engine/pieces/piece.dart';
import 'package:chess_onitama/engine/utilities/position.dart';

mixin OffsetMovement on Piece {

  List<Position>? offesets;
  
  @override
  List<Position> legalMoves(Position from) {
    var legalMoves = <Position>[];

    if(offesets == null) {
      return throw Exception('Offsets not set');
    } 

    List<Movement> directions = List.filled(offesets!.length, Movement.start);

    for(var(index, offset) in offesets!.indexed) {
      for (var i = 1; i < 8; i++) {
  
        var offsetPos = from + (offset * i);
        directions[index] = evaluateMovement(current: directions[index], offsetPos);

        if (directions[index] != Movement.stop) {
          legalMoves.add(offsetPos);
        }

      }
    }
    return legalMoves;
  }

  @override
  Movement evaluateMovement(Position position, {required Movement current}) {
    if (current == Movement.stop || current == Movement.capture) {
      return Movement.stop;
    }

    var (row, col) = position.values;
    if (row < 0 || row >= 8 || col < 0 || col >= 8) {
      return Movement.stop;
    }

    Piece? piece = chess.getPiece((row, col));
    
    var isEmpty = piece == null;
    if(isEmpty) {
      return Movement.move;
    }

    var isOpponentPiece = piece.chessColor != chessColor;
    if(isOpponentPiece) {
      return Movement.capture;
    }

    return Movement.stop;
  }
}