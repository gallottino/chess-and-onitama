import 'package:chess_onitama/engine/chess.dart';
import 'package:chess_onitama/engine/pieces/onitama/move_card.dart';
import 'package:chess_onitama/engine/utilities/color.dart';

class Onitama extends Chess {
  List<MoveCard>? moveCards = [];

  Map<ChessColor, List<MoveCard>> playerCards = {
    ChessColor.white: [],
    ChessColor.black: []
  };

  MoveCard? nextCard;
  int? selectedCardIndex;

  void selectCard(int index) {
    selectedCardIndex = index;
  }

  MoveCard? get selectedCard {
    if (selectedCardIndex == null) {
      return null;
    }

    return playerCards[turn]![selectedCardIndex!];
  }

  Onitama.init({this.moveCards}) : super.empty(width: 5, height: 5);
}
