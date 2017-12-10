# clickr game

a mindless clickr matching game.

## how it works

tiles will appear from the top left corner, to the right, and then cycle down
row by row. tiles appear randomly, and each visually differ from one another.
when the player clicks a tile, if it is touching another tile of the same color
then those two tiles will be removed. the chain will go as far as possible in
all possible cardinal directions. 

if the player clicks on an empty space, it will be filled in with a random
color.

when tiles are cleared from the top area, they fall down towards the bottom.
tiles must be cleared twice to actually remove them from the board. when tiles
are falling, they stop wherever they are blocked below (which may mean a tile
can not actually fall at all, after being cleared the first time).

the game is over when there are no available spots to spawn a new tile.

## general gameflow imagined

tiles appear slowly at first, getting faster over time. the player clears them
as they fill in the top row, and they fall to the bottom creating lumps of
like-colors. the player then clears these every now and then for mega-big clears
and feels awesome.

## player interactions

click the tiles that are touching colors of the same color. don't click the
blank spaces before they are filled! matching tiles the first time sets them to,
be cleared, and matching them a second time clears them from the board.
