import 'package:chess_onitama/engine/chess.dart';
import 'package:chess_onitama/engine/pieces/onitama/move_card.dart';
import 'package:chess_onitama/engine/pieces/onitama/pawn.dart';
import 'package:chess_onitama/engine/utilities/color.dart';
import 'package:chess_onitama/engine/utilities/position.dart';

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

  Onitama.init({this.moveCards}) : super.empty(width: 5, height: 5) {
    for (var i = 0; i < 5; i++) {
      board[0][i] =
          Pawn(chess: this, chessColor: ChessColor.black, isMaster: i == 2);
      board[4][i] =
          Pawn(chess: this, chessColor: ChessColor.white, isMaster: i == 2);
    }

    if (moveCards != null) {
      draftCards();
    }
  }

  void draftCards() {
    if (moveCards!.length < 5) {
      throw Exception("Not enough cards");
    }

    moveCards!.shuffle();

    for (var draft = 0; draft < 2; draft++) {
      playerCards[ChessColor.white]!.add(moveCards!.removeLast());
      playerCards[ChessColor.black]!.add(moveCards!.removeLast());
    }

    nextCard = moveCards!.removeLast();
  }

  @override
  bool canMoveAt(Position position) {
    if (selectedPos == null || selectedCardIndex == null) {
      return false;
    }

    var piece = getPieceAt(selectedPos!) as Pawn;
    piece.moveCard = selectedCard;
    return super.canMoveAt(position);
  }

  @override
  bool moveAt(Position newPosition) {
    var currentTurn = turn;
    MoveCard? current = selectedCard;

    var moved = super.moveAt(newPosition);
    if (moved) {
      playerCards[currentTurn]![selectedCardIndex!] = nextCard!;
      nextCard = current;
      selectedCardIndex = null;
    }

    return moved;
  }

  void loadCardsFromJson(Map<String, dynamic> json) {
    moveCards = [];
    for (var moveCard in json["cards"]) {
      moveCards!.add(MoveCard.fromJson(moveCard));
    }

    draftCards();
  }
}
