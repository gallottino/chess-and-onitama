import 'dart:convert';

import 'package:chess_onitama/engine/onitama.dart';
import 'package:chess_onitama/engine/utilities/color.dart';
import 'package:chess_onitama/engine/utilities/position.dart';
import 'package:chess_onitama/widgets/onitama/move_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnitamaWidget extends StatefulWidget {
  const OnitamaWidget({super.key});

  @override
  State<OnitamaWidget> createState() => _OnitamaWidgetState();
}

class _OnitamaWidgetState extends State<OnitamaWidget> {
  final Onitama onitama = Onitama.init();

  bool loading = true;

  @override
  void initState() {
    loadCards();
    super.initState();
  }

  Future<bool> loadCards() async {
    final String response =
        await rootBundle.loadString('assets/move_cards.json');
    final data = await json.decode(response);

    setState(() {
      onitama.loadCardsFromJson(data);
      loading = false;
    });

    return true;
  }

  Widget chessboard() {
    return SizedBox(
        width: 300,
        height: 300,
        child: Stack(
          children: [
            GridView.count(
              crossAxisCount: 5,
              children: List.generate(25, (index) {
                var row = index ~/ 5;
                var col = index % 5;

                return Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: (row == 0 || row == 4) && col == 2
                            ? const Color.fromARGB(255, 198, 97, 63)
                            : const Color.fromARGB(255, 238, 238, 210),
                        border: Border.all(
                            color: const Color.fromARGB(255, 173, 173, 152))),
                  ),
                );
              }),
            ),
            GridView.count(
                crossAxisCount: 5,
                children: List.generate(25, (index) {
                  var row = index ~/ 5;
                  var col = index % 5;

                  var current = Position(row, col);
                  return DragTarget<String>(
                      onWillAcceptWithDetails: (details) =>
                          onitama.canMoveAt(current),
                      onAcceptWithDetails: (details) => setState(() {
                            onitama.moveAt(current);
                          }),
                      builder: (context, candidate, rejected) {
                        if (onitama.isEmptyAt(current)) {
                          return Container();
                        }

                        var piece = Center(
                            child: Text(
                          onitama.getPieceAt(current).toString(),
                          style: const TextStyle(
                              fontFamily: 'Pecita',
                              fontSize: 45,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                              color: Colors.black),
                        ));

                        return Draggable<String>(
                          data: onitama.getPieceAt(current).toString(),
                          feedback: piece,
                          onDragStarted: () {
                            setState(() {
                              onitama.selectedPos = current;
                            });
                          },
                          onDragEnd: (details) {
                            setState(() {
                              onitama.deselect();
                            });
                          },
                          childWhenDragging: Container(),
                          child: piece,
                        );
                      });
                }))
          ],
        ));
  }

  Widget playerCards(ChessColor color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var (index, card) in onitama.playerCards[color]!.indexed)
          GestureDetector(
            onTap: () {
              if (onitama.turn != color) return;
              setState(() {
                onitama.selectCard(index);
              });
            },
            child: MoveCardWidget(
              card: card,
              selected: onitama.selectedCard?.name == card.name,
              color: color,
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const CircularProgressIndicator()
        : Column(
            children: [
              playerCards(ChessColor.black),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                chessboard(),
                MoveCardWidget(
                  card: onitama.nextCard!,
                  color: onitama.turn,
                )
              ]),
              playerCards(ChessColor.white),
            ],
          );
  }
}
