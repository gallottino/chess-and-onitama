import 'package:chess_onitama/engine/pieces/piece.dart';
import 'package:chess_onitama/engine/utilities/color.dart';
import 'package:chess_onitama/engine/utilities/position.dart';

class Chess {
  final List<List<Piece?>> board;
  final List<Piece> capturedPieces = [];

  final int width, height;

  Position? selectedPos;
  ChessColor turn = ChessColor.white;

  Chess.empty({this.width = 8, this.height = 8})
      : board = List.generate(height, (i) => List.generate(width, (j) => null));

  factory Chess.fromUnicode(List<List<String>> chessboard) {
    int width = chessboard[0].length;
    int height = chessboard.length;
    Chess chess = Chess.empty(width: width, height: height);

    for (int row = 0; row < height; row++) {
      for (int col = 0; col < width; col++) {
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
    if (!canMoveAt(newPosition)) return false;

    var capturePiece = getPieceAt(selectedPos!).move(selectedPos!, newPosition);
    if (capturePiece != null) {
      capturedPieces.add(capturePiece);
    }

    selectedPos = null;
    turn = turn == ChessColor.white ? ChessColor.black : ChessColor.white;
    return true;
  }

  bool isEmptyAt(Position position) {
    var (row, col) = position.values;
    if (row < 0 || row >= height || col < 0 || col >= width) {
      return true;
    }
    return board[row][col] == null;
  }

  Piece getPieceAt(Position position) {
    var (row, col) = position.values;
    return board[row][col]!;
  }
}
