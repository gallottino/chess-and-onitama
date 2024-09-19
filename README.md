# Refactoring Chess to Onitama

This project started as a traditional chess game. The codebase had several issues that needed to be addressed. Here, we document the refactoring process, techniques used, and how we transformed the chess game into Onitama.

## Initial Code Smells
The initial code had several code smells, including:
- **Long Methods**: Functions that were too long and did too many things.
- **Duplicated Code**: Similar code blocks scattered throughout the codebase.
- **Poor Naming Conventions**: Variables and functions with non-descriptive names.
- **Lack of Abstraction**: Hardcoded values and lack of modularity.

## Refactoring Techniques Used
1. **Guard Clause**: We simplify conditional expression for a method ([fcd9705](https://github.com/gallottino/chess-and-onitama/commit/fcd970545f020cc79244f48660fb1350bf0d3907))
2. **Remove Duplicated Code**: We identified and consolidated duplicated code into reusable functions ([eacb1af](https://github.com/gallottino/chess-and-onitama/tree/eacb1afd184b012c0bd0131e0e3034ecb61774c9))
4. **Moving Feature**: We extrapolate the offset movement feature for all pieces ([299e894](https://github.com/gallottino/chess-and-onitama/commit/299e8948f0868d0a29823f7eb15d6b389693ee6a))
5. **Many Other techniques** (see in git history refactor keyword)

## Abstracting the Game Logic
To make the game logic more modular and reusable, we abstracted the core components:
- **Game Class**: Represents the game board and handles piece placement and movement.
- **Piece Class**: Represents individual pieces and their movement rules.

## Building Onitama
With a clean and modular codebase, we extended the game to support Onitama:
- **Movement Cards**: Introduced a new class to handle the dynamic movement cards unique to Onitama.
- **Customizable Boards**: Added support for different board sizes and configurations.

## Preview
| **Chess** (branch: *[main](https://github.com/gallottino/chess-and-onitama)*) | **Onitama** (branch: *[onitama-variant](https://github.com/gallottino/chess-and-onitama(https://github.com/gallottino/chess-and-onitama/tree/onitama-variant))*) |
| -------- | ------- |
| <img width="445" alt="Screenshot 2024-09-19 alle 12 22 21" src="https://github.com/user-attachments/assets/52975943-5c99-4923-aa84-835858ea3205"> | <img width="608" alt="Screenshot 2024-09-19 alle 12 18 47" src="https://github.com/user-attachments/assets/9dfded50-b914-4724-a741-c995883889da"> |

## Resources

### Books
1. [Refactoring: Improving the Design of Existing Code](https://www.amazon.it/Refactoring-Improving-Design-Existing-Code/dp/0134757599)
1. [Refactoring to Patterns](https://www.amazon.it/Refactoring-Patterns-Addison-Wesley-Signature-English-ebook/dp/B001TKD4RQ)
1. [Clean Code: A Handbook of Agile Software Craftsmanship](https://www.amazon.it/Clean-Code-Handbook-Software-Craftsmanship-ebook/dp/B001GSTOAM)
1. [Clean Architecture: A Craftsman's Guide to Software Structure and Design](https://www.amazon.it/Clean-Architecture-Craftsmans-Software-Structure-ebook/dp/B075LRM681)

### Video
1. [Three Ideas on Refactoring by Martin Fowler (Christopher Okhravi)](https://www.youtube.com/watch?v=u8Da6k5IKPI)


### Web
1. [Chess Rules](https://en.wikipedia.org/wiki/Chess)
1. [Onitama Rules](https://en.wikipedia.org/wiki/Onitama)
1. [Onitama Board Game Geek](https://boardgamegeek.com/boardgame/160477/onitama)
1. [What are mixin in Dart (Romain Rastel)](https://medium.com/flutter-community/dart-what-are-mixins-3a72344011f3)


