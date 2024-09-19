class Position implements Comparable<Position> {
  final int row, col;
  const Position(this.row, this.col);
  (int, int) get values => (row, col);

  @override
  String toString() => '($row, $col)';

  @override
  bool operator ==(Object other) {
    return other is Position && compareTo(other) == 0;
  }

  Position operator +(Position other) {
    return Position(row + other.row, col + other.col);
  }

  Position operator *(int factor) {
    return Position(row * factor, col * factor);
  }

  @override
  int compareTo(Position other) {
    if (row == other.row && col == other.col) {
      return 0;
    }

    if (row == other.row) {
      return col - other.col;
    }

    return row - other.row;
  }

  @override
  int get hashCode => row * 10 + col;
}
