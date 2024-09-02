import 'package:chess_onitama/engine/chess.dart';
import 'package:chess_onitama/engine/utilities/position.dart';
import 'package:chess_onitama/widgets/piece_widget.dart';
import 'package:flutter/material.dart';

class ChessWidget extends StatefulWidget {
  const ChessWidget({super.key});

  @override
  State<ChessWidget> createState() => _ChessWidgetState();
}

class _ChessWidgetState extends State<ChessWidget> {
  Chess chess = Chess.fromUnicode([
    ['♜', '♞', '♝', '♛', '♚', '♝', '♞', '♜'],
    ['♟', '♟', '♟', '♟', '♟', '♟', '♟', '♟'],
    ['■', '□', '■', '□', '■', '□', '■', '□'],
    ['□', '■', '□', '■', '□', '■', '□', '■'],
    ['■', '□', '■', '□', '■', '□', '■', '□'],
    ['□', '■', '□', '■', '□', '■', '□', '■'],
    ['♙', '♙', '♙', '♙', '♙', '♙', '♙', '♙'],
    ['♖', '♘', '♗', '♕', '♔', '♗', '♘', '♖'],
  ]);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
          width: 400,
          height: 400,
          child: GridView.count(
              crossAxisCount: 8, // Number of columns
              children: List.generate(64, (index) {
                var row = index ~/ 8;
                var col = index % 8;

                return Center(
                    child: Container(
                        color: row % 2 == col % 2
                            ? const Color.fromARGB(255, 238, 238, 210)
                            : const Color.fromARGB(255, 118, 150, 210)));
              }))),
      SizedBox(
          width: 400,
          height: 400,
          child: GridView.count(
              crossAxisCount: 8, // Number of columns
              children: List.generate(64, (index) {
                var row = index ~/ 8;
                var col = index % 8;
                return DragTarget<String>(
                    onMove: (details) {},
                    onWillAcceptWithDetails: (details) {
                      if (chess.selectedPos == null) return false;
                      return chess.canMoveAt(Position(row, col));
                    },
                    onAcceptWithDetails: (details) {
                      setState(
                        () {
                          chess.moveAt(Position(row, col));
                        },
                      );
                    },
                    builder: (contest, candidateData, rejectedData) {
                      if (chess.isEmptyAt(Position(row, col))) {
                        return Container();
                      }

                      var piece = chess.getPieceAt(Position(row, col));
                      if (piece.chessColor != chess.turn) {
                        return PieceWidget(piece: piece);
                      }

                      return Draggable<String>(
                        data: chess.board[row][col].toString(),
                        feedback: PieceWidget(piece: chess.board[row][col]),
                        onDragStarted: () => {
                          setState(() {
                            chess.selectPieceAt(Position(row, col));
                          }),
                        },
                        onDragEnd: (details) {
                          setState(() {
                            chess.deselect();
                          });
                        },
                        childWhenDragging: Container(),
                        child: PieceWidget(piece: chess.board[row][col]),
                      );
                    });
              })))
    ]);
  }
}
