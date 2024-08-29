import 'package:chess_onitama/engine/utilities/position.dart';

enum MovementKind { start, move, capture, stop }

abstract class Movement {
  List<Position> legalMoves(Position from);

  MovementKind evaluateMovement(Position position,
      {required MovementKind current});
}
