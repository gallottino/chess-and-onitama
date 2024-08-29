import 'package:chess_onitama/engine/chess.dart';
import 'package:chess_onitama/engine/utilities/color.dart';
import 'package:chess_onitama/engine/utilities/position.dart';

enum MovementKind { start, move, capture, stop }

abstract class Movement {
  final Chess chess;
  final ChessColor chessColor;

  const Movement({required this.chess, required this.chessColor});

  List<Position> legalMoves(Position from);
}
