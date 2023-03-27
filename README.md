# Space Game README

## Setup
This game requires Processing4 to run. Also, make sure the folder that the game is in is called SpaceGame or the game will not run correctly. If the folder is not SpaceGame, rename it. Then open the SpaceGame.pde file in Processing4.

## Description

Space Game is a fun spaceship game where you fight aliens, avoid missiles, and go through barriers that show up more often as you kill aliens. Grab power-ups to get more missiles and try to get the highest score!

## Keystrokes/Mouse

- AWSD or the arrow keys for movement
- Spacebar to shoot missiles
- Backspace to pause game
- Mouse click to navigate the menu

## Known bugs/problems

- If backspace is pressed at the start screen or game over screen, the Pause menu appears when the game starts, but the game isn't actually paused.
- Occasionally, a barrier may not spawn right away when starting a new game (difficult to reproduce).
- deltaTime is not passed to the Alien Ship/Missiles, which may cause problems if the framerate is set higher than expected.

## References

Any sources referred to during the development of the assignment (be precise and specific with references) {there no need to reference lecture/lab materials}:

- [Bounding Box Collision Detection](https://iopscience.iop.org/article/10.1088/1742-6596/1114/1/012099/pdf#:~:text=The%20bounding%20box%20collision%20detection,not%20penetrate%20against%20the%20enemy)
- [2D Collision Detection](https://developer.mozilla.org/en-US/docs/Games/Techniques/2D_collision_detection)
- [Rectangle-Rectangle Collision Detection](http://www.jeffreythompson.org/collision-detection/rect-rect.php)
- [KeyEvent Java documentation](https://docs.oracle.com/javase/8/docs/api/java/awt/event/KeyEvent.html)
- [NullPointerException documentation](https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it)
- [Processing.org video tutorial](https://www.youtube.com/watch?v=z903vXot-Lg)
- [keyCode Java documentation](https://processing.org/reference/keyCode.html)
- [String Java documentation](https://docs.oracle.com/javase/8/docs/api/java/lang/String.html)
- [Vectors review on Khan Academy](https://www.khanacademy.org/math/precalculus/x9e81a4f98389efdf:vectors/x9e81a4f98389efdf:component-form/a/vector-magnitude-and-direction-review)
