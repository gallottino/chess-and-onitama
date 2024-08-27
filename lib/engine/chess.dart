import 'package:chess_onitama/engine/pieces/piece.dart';

class Chess {
  final List<List<Piece?>> board;

  Chess.empty()
      : board = List.generate(8, (i) => List.generate(8, (j) => null));

  const Chess.withBoard(this.board);

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

  Piece? getPiece((int, int) position) {
    var (row, col) = position;
    return board[row][col];
  }
}
