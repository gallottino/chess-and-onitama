import 'package:chess_onitama/engine/pieces/piece.dart';
import 'package:chess_onitama/engine/utilities/color.dart';
import 'package:chess_onitama/engine/utilities/position.dart';

class Chess {
  final List<List<Piece?>> board;
  final List<Piece> capturedPieces = [];

  Position? selectedPos;
  ChessColor turn = ChessColor.white;

  Chess.empty()
      : board = List.generate(8, (i) => List.generate(8, (j) => null));

  factory Chess.fromUnicode(List<List<String>> chessboard) {
    Chess chess = Chess.empty();

    for (int row = 0; row < 8; row++) {
      for (int col = 0; col < 8; col++) {
        var unicodeValue = chessboard[row][col];
        if (['■', '□'].contains(unicodeValue)) {
          continue;
        }

        chess.board[row][col] = Piece.fromUnicode(unicodeValue, chess);
      }
    }

    return chess;
  }

  bool selectPieceAt(Position position) {
    if (isEmptyAt(position)) {
      return false;
    }

    var piece = getPieceAt(position);
    if (piece.chessColor != turn) {
      return false;
    }

    selectedPos = position;
    return true;
  }

  void deselect() => selectedPos = null;

  bool canMoveAt(Position position) {
    if (selectedPos == null) {
      return false;
    }

    var piece = getPieceAt(selectedPos!);
    return piece.legalMoves(selectedPos!).contains(position);
  }
  bool moveAt(Position newPosition) {
    if(!canMoveAt(newPosition)) return false;

    var selectedPiece = getPieceAt(selectedPos!);
    var (row,col) = selectedPos!.values;
    board[row][col] = null;

    if (!isEmptyAt(newPosition)) {
      capturedPieces.add(getPieceAt(newPosition));
    }
    var (newRow, newCol) = newPosition.values;
    board[newRow][newCol] = selectedPiece;

    selectedPos = null;
    turn = turn == ChessColor.white ? ChessColor.black : ChessColor.white;
    return true;
  }

  bool isEmptyAt(Position position) {
    var (row, col) = position.values;
    if(row < 0 || row >= 8 || col < 0 || col >= 8) {
      return true;
    }
    return board[row][col] == null;
  }

  Piece getPieceAt(Position position) {
    var (row, col) = position.values;
    return board[row][col]!;
  }
}
