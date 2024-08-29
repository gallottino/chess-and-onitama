import 'package:chess_onitama/engine/pieces/piece.dart';
import 'package:chess_onitama/engine/moveset/movement.dart';
import 'package:chess_onitama/engine/utilities/position.dart';

class Bishop extends Piece {
  Bishop({required super.chess, required super.chessColor});

  @override
  List<Position> legalMoves(Position from) {
    var (row, col) = from.values;
    var legalMoves = <Position>[];

    /// directions: [right-up, left-down, right-down, left-up]
    List<MovementKind> directions = [
      MovementKind.start,
      MovementKind.start,
      MovementKind.start,
      MovementKind.start
    ];

    for (var i = 1; i < 8; i++) {
      directions[0] = evaluateMovement(current: directions[0], Position(row + i, col + i));
      if (directions[0] != MovementKind.stop) {
        legalMoves.add(Position(row + i, col + i));
      }

      directions[1] = evaluateMovement(current: directions[1], Position(row - i, col - i));
      if (directions[1] != MovementKind.stop) {
        legalMoves.add(Position(row - i, col - i));
      }

      directions[2] = evaluateMovement(current: directions[2], Position(row + i, col - i));
      if (directions[2] != MovementKind.stop) {
        legalMoves.add(Position(row + i, col - i));
      }

      directions[3] = evaluateMovement(current: directions[3], Position(row - i, col + i));
      if (directions[3] != MovementKind.stop) {
        legalMoves.add(Position(row - i, col + i));
      }
    }
    return legalMoves;
  }

  @override
  MovementKind evaluateMovement(Position position, {required MovementKind current}) {
    if (current == MovementKind.stop || current == MovementKind.capture) {
      return MovementKind.stop;
    }

    var (row, col) = position.values;
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
