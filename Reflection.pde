/* Reflection

Name : Peter Fortune

Student Number: 20011462

Link to your development Blog on Blogger:                
    https://setu-hdips-2023-pfortune.blogspot.com/

Link to Video on YouTube:
    e.g. https://youtu.be/DvnEIN8FIgA


Part A - Mark (11/11)
-----------------------------

Inclusion of completed:
- Readme            (1)
- Reflection        (4)
- Video             (4)
- Blog              (2)

These are all created to spec, so I am awarding myself 11 marks!


Part B - Mark (4/4)
-----------------------------

- Comments, 
- Indentation, 
- Naming, 
- Structure of code.


Part C - Mark (5/5)
-----------------------------
Use of standard programming control constructs 
(if, loop, nesting):

* if statements

line 51 is an IF to check a boolean (if game has started)
line 56 is an nested IF to check if the player has 0 lives and if the scoreboard needs to be updated
line 278 is an IF with multiple branches to check if playerName is null, or if it empty, or if it is a certain length 

* Loops

FOR loops used in main Game file:
line 172 to update barrier positions and draw them
line 193 in iterate through ship missiles to check for collisions on barriers

While Loops used in Explosion class:
line 44 to update all the puffball objects in the explosion
line 59 to display all the puffball objects in the explosion
line 75 to check if the puffball objects have expired or not

NESTED loops used in main Game file:
line 147 is the outer loop to iterate through aliens
line 148 to the inner nested loop to over the alien missiles, and check if any collided with the player ship

line 115 is the outer loop to iterate through pickups and check if a ship has collided with them to pick them up
line 129 to the inner nested loop to check if a barrier has hit a pickup, and the pickup needs to be removed

I have multiple examples of nesting, if statements and loops so 5/5!

Part D1 - Mark (10/10)
-----------------------------

My game demonstrates use of collision detection, scoring, lives, game resets correctly to play a new game. There is a 
high score table, there are multiple objects (ship, alien ship, barrier, gaps, missiles, pickups), ability to pause 
and a very simple menu system.

Therefore I score 10/10


Part D2 - Mark (9/10)
-----------------------------
I have a key handler set up on line 431 and 437 in the main Game file, which pass on to the dedicated KeyHandler class.
it handles: 
- left (A) or 
- right (D)
- up (W)
- down (S)

- It also handles the cursor keys to navigate

Additional keys include
- [space] to fire missile
- backspace to pause

I have working key handler, cursor keys too, and an additional 2 key features so I am awarding 9/10!


Part D3 - Mark (10/10)
-----------------------------
There are many collision detection methods implemented in the game file.

checkPickupCollisions() on line 110 to detect collisions between the Player Ship and Pickups, and also to check for 
collisions with Barriers and Pickups. Called on line 104

checkShipAlienMissileCollisions() on line 143 to detect collisions between the Aliens Missiles and the Player Ship. 
Called on line 102.

checkAlienShipCollisions() on line 216 to detect collisions between the Alien Ship and the Player Ship. Called on line 98.

checkAlienShipMissileCollisions() on line 242 to detect collisions between the Player Ship Missiles and the Aliens. 
Called on line 100.

checkBarrierCollisions() on line 167 to detect collisions between the Barrier and the Player Ship, and also to check 
collisions between the Barrier and the Player Ship missiles.

I have 7 collision detection checks between 6 different objects:

Alien Missile
Ship Missile
Alien Ship
Player Ship
Barrier
Pickup

With the collision checks being:

Alien Missile & Player Ship
Alien Ship & Player Ship
Player Missile & Alien Ship
Player Missile & Barrier
Player Ship & Barrier
Player Ship & Pickup
Pickup & Barrier

There is also additional collision checks not performed in the main Game file between Ship, Missile & Pickup with a 
Gap that occurs in the Barrier class during a collision check with the Barrier.

The ship cannot move outside the scope of the play area, this is enforced in the move method of the Ship class on 
line 228.

 10/10


-----------------------------
Part E USER DEFINED CLASSES
-----------------------------

Part E1 - Mark (10/10)
-----------------------------
Excluding the player class and the main program, I have 13 other classes defined in their own files/tabs:

1- Barrier
2- BoundingBox
3- Button
4- Enemy
5- Explosion
6- Gap
7- KeyHandler
8- Missile
9- Pickup
10- PuffBall
11- Scoreboard
12- Ship
13- Vector2

Each of these user-defined classes has appropriate fields, constructors, getters, setters. These are highlighted as follows:

1.Barrier CLASS
  Fields begin line: 3
  Overloaded Constructors begin line: 9, 23, 29
  Getters begin line: 156
  Setters begin line: 132
  Bespoke methods begin line: 42

2.BoundingBox CLASS
  Fields begin line: 3
  Constructors begin line: 7
  Getters begin line: 66
  Setters begin line: 50
  Bespoke methods begin line: 16

3.Button CLASS
  Fields begin line: 2
  Constructors: 6
  Getters begin line: 136
  Setters begin line: 117
  Bespoke methods begin line: 21

4.Enemy CLASS
  Fields begin line: 3
  Constructors: 11
  Getters begin line: 69
  Setters begin line: 45
  Bespoke methods begin line: 15

5.Explosion CLASS
  Fields begin line: 3
  Constructors: 11
  Getters begin line: 113
  Setters begin line: 93
  Bespoke methods begin line: 42

6.Gap CLASS
  Fields begin line: 3
  Overloaded Constructors: 7, 19
  Getters begin line: 83
  Setters begin line: 67
  Bespoke methods begin line: 29

7.KeyHandler CLASS
  Fields begin line: 3
  Constructors: 6
  Getters begin line: 86
  Setters begin line: 62
  Bespoke methods begin line: 16

8.Missile CLASS
  Fields begin line: 3
  Overloaded Constructors: 12, 22
  Getters begin line: 139
  Setters begin line: 91
  Bespoke methods begin line: 33

9.Pickup CLASS
  Fields begin line: 2
  Constructors: 5
  Getters begin line: 46
  Setters begin line: 34
  Bespoke methods begin line: 16

10.PuffBall CLASS
  Fields begin line: 2
  Overloaded Constructors: 8, 19
  Getters begin line: 87
  Setters begin line: 51
  Bespoke methods begin line: 24

11.Scoreboard CLASS
  Fields begin line: 2
  Constructors: 6
  Getters begin line: 68
  Setters begin line: 56
  Bespoke methods begin line: 17

12.Ship CLASS
  Fields begin line: 3
  Constructors: 15
  Getters begin line: 295
  Setters begin line: 263
  Bespoke methods begin line: 36

13.Vector2 CLASS
  Fields begin line: 2
  Overloaded Constructors: 7, 15
  Getters begin line: 43
  Setters begin line: 35
  Bespoke methods begin line: 23

I have documented 13 classes and they include overloaded constructors therefore I am scoring 10/10



Part E2 - Mark (9/10)
-----------------------------

Class bespoke methods i.e. private helper methods:

I have many bespoke methods within my 13 classes, some are private helper methods and most are public helper methods.
I have highlighted methods from 6 of these classes below:


1. Barrier Class

line 42 takes in 1 parameter and returns a boolean (public)
line 60 takes in 2 parameters and returns NO value (private)
line 65 takes in 1 parameters and returns NO value (public)

2. BoundingBox Class
line 16 takes in 0 parameters and returns NO value (public)
line 24 takes in 1 parameter and returns a boolean (public)

3. Button Class

line 15, 19 takes in either 1 or 4 parameters and returns NO value (overloaded public)

4. Ship Class

line 211 takes in 2 parameters and returns a value (private)
line 194 takes in 0 parameters and returns no value (private)
line 178 takes in 2 parameters and returns a value (private)

5. Missile Class
line 45 takes 0 parameters and returns a boolean value (public)

6. Scoreboard Class
line 17 takes 2 parameters and returns no value (public)

Private & public helper methods for 6 of the 13 classes are highlighted showing multiple examples of Methods with 
no return values, return values, parameters, and a single instance of overloading. I am awarding myself 9/10


Part E3 - Mark (10/10)
-----------------------------

- The user-defined class(es) are USED in an appropriate manner 

multiple declarations of user defined classes are USED:
Barrier - line 5, to declare BoundingBox object
Barrier - line 6, to declare Gap[] object array
Ship - line 9, to declare Missile[] object array
Ship - line 8, to declare KeyHandler

Barrier - line 17, to initialise Gap[] array
Barrier - line 19, to initialise BoundingBox
Ship - line 26 to initialise Missile[] array
Ship - line 25 to initialise the KeyHandler object

getters/setters are USED on...
Barrier - line 12-16, 25, 31-35, 37 setters are used to initialise class
Barrier - line 39 getters are used to initialise BoundingBox
Barrier - line 61 getters are used as parameters to addGap method
Ship - line 96 getters are used to build ship shapes
Ship - line 77 setters are used to reposition ship after a collision

default constructors USED on lines...
Game - line 44 the default constructor for the Button class is called
Ship - line 78 the default constructor for the Explosion class is called
Missile - line 29 the default constructor for the BoundingBox class is called

overloaded constructors USED on lines...
Game - line 329 the overloaded constructor for the Button class is called
Ship - line 135 the overloaded constructor for the Missile class is called
Ship - line 152 the overloaded constructor for the PuffBall class is called

array variables USED on lines...
Ship - line 211 takes an array of PuffBall[] and returns an array
Ship - line 178 takes an array of Missile[] and returns an array

I've used multiple declarations and initialisations of user defined classes, getters and setters created 
in each class and used throughout my game, default constructors & overloaded constructors used where appropriate 
also and also array variables. I award myself full marks.

------------------------
PART F - DATA STRUCTURES
------------------------

Part F1 - Mark (6/10)
-----------------------------
- Use of a data structure to store information i.e. array

Ship , line 9 

<<use [TABName]line y to be specific>>

declared on line...to ...
initialized on line... 
used on line...
...

I use many datastructures array and object throughout my game. However, as I do not create an array sized based on input from the user, I am awarding myself 6/10.

Part F2 - Mark (8/10)
-----------------------------
- Calculations performed on the information stored

Vector2 - line 25 - normalizeForm method - uses dist() math method
From Game in the Alien/Ship collision detect for loop, iterates over an array of aliens (using .length to determine the size of the array), the Alien enemy update method is called, which uses the Vector2 class to determine where an alien should go based on the position of the Player Ship.

Explosion - line 15 - in contructor method - uses ceil() math method
The ceil math method has been used to determine the size of the explosion to be generated bassed on the value passed to the constructor divided by 2, ceil will round this up to the nearest integer

Explosion - line 30 - in constructor method - uses random() math method
The size of the different puffballs to be added to the puffball array is determined by selecting random values for each of the parameters within a range, and then add a new puffball object to the array with those values. This is performed in a for loop.

Gap - line 42, 43 - in merge method - uses min() & max() math methods
This method is called from the Barrier class when a missile hits the barrier forming a new gap, this checks if the new gap is beside any existing gaps and whether they need to be merged. If they do need to be merged, then we calculate the new x position for the merged gap with the min() method and how wide it should be using the max() method by finding out which gap had the higher x position and substracting them from each other.

Game - line 77 - millis() method
Used in many locations throughout the game, and in this instance to check when a new barrier should be added to the game 


8+6+10+9+10+10+9+10+5+4+11
TOTAL MARK = 92


FINAL CHECK:
I have checked the constraints (and I am not breaking any constraints)

*/
