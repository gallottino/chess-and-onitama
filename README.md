# Refactoring Chess to Onitama

This project started as a traditional chess game, but the codebase had several issues that needed to be addressed. Here, we document the refactoring process, techniques used, and how we transformed the chess game into Onitama.

## Initial Code Smells
The initial chess code had several code smells, including:
- **Long Methods**: Functions that were too long and did too many things.
- **Duplicated Code**: Similar code blocks scattered throughout the codebase.
- **Poor Naming Conventions**: Variables and functions with non-descriptive names.
- **Lack of Abstraction**: Hardcoded values and lack of modularity.

## Refactoring Techniques Used
1. **Extract Method**: We broke down long methods into smaller, more manageable functions.
2. **Remove Duplicated Code**: We identified and consolidated duplicated code into reusable functions.
3. **Rename Variables and Functions**: We renamed variables and functions to be more descriptive and meaningful.
4. **Introduce Abstraction**: We created classes and modules to encapsulate related functionalities.
5. **Extract widget trought methods**: 

## Abstracting the Game Logic
To make the game logic more modular and reusable, we abstracted the core components:
- **Board Class**: Represents the game board and handles piece placement and movement.
- **Piece Class**: Represents individual pieces and their movement rules.
- **Game Class**: Manages the overall game state, including turns and win conditions.

## Building Onitama
With a clean and modular codebase, we extended the game to support Onitama:
- **Movement Cards**: Introduced a new class to handle the dynamic movement cards unique to Onitama.
- **Customizable Boards**: Added support for different board sizes and configurations.


## Conclusion
By refactoring the initial chess code, we were able to create a clean, modular, and extensible codebase. This allowed us to easily build Onitama as a chess variant, providing a rapid way to scale your business and to test new use cases.


## Bibliografy
1. "Refactor your codebase" - Martin Fowler
2. "Clean Code" - Martin Fowler
3. "Clean Architecture" - Martin Fowler
4. "Game Design Pattern" - 
5. Chess - https://en.wikipedia.org/wiki/Chess
6. Onitama - https://en.wikipedia.org/wiki/Onitama

