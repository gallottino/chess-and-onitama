import 'package:chess_onitama/engine/pieces/onitama/move_card.dart';
import 'package:chess_onitama/engine/utilities/color.dart';
import 'package:chess_onitama/engine/utilities/position.dart';
import 'package:flutter/material.dart';

class MoveCardWidget extends StatelessWidget {
  final MoveCard card;
  final bool selected;
  final ChessColor color;
  const MoveCardWidget(
      {super.key,
      required this.card,
      this.selected = false,
      required this.color});

  bool isCenter(Position current) {
    return current == const Position(2, 2);
  }

  bool isLegalMove(Position current) {
    var direction = reversed ? -1 : 1;
    return card.offsets
        .map((offset) => offset * direction)
        .contains(current - const Position(2, 2));
  }

  bool get reversed {
    return color == ChessColor.black;
  }

  Widget iconBox() {
    return SizedBox(
      width: 100,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: reversed
            ? [
                Text(card.kanji, style: const TextStyle(fontSize: 40)),
                Text(card.name, style: const TextStyle(fontSize: 25)),
              ]
            : [
                Text(card.name, style: const TextStyle(fontSize: 25)),
                Text(card.kanji, style: const TextStyle(fontSize: 40)),
              ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 230,
      height: 150,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 238, 238, 210),
          border: Border.all(
              color: selected ? Colors.orange : Colors.transparent, width: 4)),
      child: Center(
        child: Row(children: [
          color == ChessColor.white
              ? iconBox()
              : const SizedBox(
                  width: 20,
                  height: 20,
                ),
          SizedBox(
            width: 100,
            height: 100,
            child: GridView.count(
              crossAxisCount: 5,
              children: List.generate(25, (index) {
                var row = index ~/ 5;
                var col = index % 5;

                var current = Position(row, col);
                var colors = {
                  isCenter(current): const Color.fromARGB(255, 65, 109, 219),
                  isLegalMove(current):
                      const Color.fromARGB(255, 128, 137, 200),
                  !isLegalMove(current) && !isCenter(current): Colors.white
                };

                return Container(
                  decoration: BoxDecoration(
                    color: colors.entries
                        .firstWhere((condition) => condition.key == true)
                        .value,
                    border: Border.all(
                        color: const Color.fromARGB(255, 173, 173, 152)),
                  ),
                );
              }),
            ),
          ),
          color == ChessColor.black ? iconBox() : Container(),
        ]),
      ),
    );
  }
}
