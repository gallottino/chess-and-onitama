import 'package:chess_onitama/engine/pieces/piece.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PieceWidget extends StatelessWidget {
  final Function? onDrag;
  final Piece? piece;
  const PieceWidget({super.key, this.onDrag, this.piece});

  get icon => piece == null ? '' : piece!.toString();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Center(
          child: Text(icon,
              style: const TextStyle(
                  fontSize: 45,
                  fontFamily: 'Pecita',
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                  color: Colors.black))),
    );
  }
}
