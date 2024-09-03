import 'package:chess_onitama/engine/chess.dart';
import 'package:chess_onitama/engine/pieces/onitama/move_card.dart';

class Onitama extends Chess {
  final List<MoveCard> moveCards;

  Onitama.empty({required this.moveCards}) : super.empty(width: 5, height: 5);
}
