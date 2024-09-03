import 'package:chess_onitama/engine/utilities/position.dart';

class MoveCard {
  final String name;
  final String kanji;
  final List<Position> offsets;

  const MoveCard(
      {required this.name, required this.offsets, required this.kanji});

  MoveCard.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        offsets = (json['moves'] as List)
            .map((offsets) => Position(offsets[0], offsets[1]))
            .toList(),
        kanji = json['kanji'];
}
