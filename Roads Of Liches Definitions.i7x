Version 1/230528 of Roads Of Liches Definitions by Andrew Schultz begins here.

"This encompasses small stubs, particularly 'to decide which' and 'definition' code that would clutter up the main code and be hard to find otherwise."

volume basic definitions

to decide which region is mrlp: decide on map region of location of player; [this is just a keystroke saver]

definition: a direction (called di) is viable:
	if the room di of location of player is nowhere, no;
	yes;

to say gen-dir of (di - a direction):
	say "[di]";
	let rdl be the room di of location of player;
	unless rdl is nowhere or rdl is unvisited, say " to [rdl]";

volume useful stubs

book directions

the cardinal directions only rule is listed first in the check going rules.

check going (this is the cardinal directions only rule):
	if noun is not cardinal, say "Only the four basic directions are used here." instead;

definition: a direction (called di) is rejectable:
	if the room di of location of player is visited, no;
	yes;

chapter one way rooms

a room can be oneway. a room is usually not oneway.

last-dir is a direction that varies

after going to a oneway room:
	now last-dir is noun;
	continue the action;

check going when location of player is oneway:
	if noun is last-dir, say "No, [location of player] is cut in half. You can only go back [opposite of noun]." instead;

book scores

the score and thinking changes rule is listed instead of the notify score changes rule in the turn sequence rulebook.

to say went-by (nu - a number): say "just went [if nu > 0]up[else]down[end if] by [nu in words] point[unless nu is 1 or nu is -1]s[end if]";

this is the score and thinking changes rule:
	let bonus-delt be cur-bonus - last-cur-bonus;
	let sco-delt be current-score - last-current-score;
	if sco-delt is 0 and bonus-delt is 0, continue the action;
	say "[i][bracket]Your score ";
	if bonus-delt is 0:
		say "[went-by sco-delt]";
	else if bonus-delt is sco-delt:
		say "and bonus points [went-by bonus-delt]";
	else:
		say "[went-by sco-delt], and your bonus points [went-by bonus-delt]";
	say ".[close bracket][r][line break]";
	now last-cur-bonus is cur-bonus;
	now last-current-score is current-score;

to chest-bonus:
	if player does not have treat chunk and used-cheats is false:
		up-min;
		process the score and thinking changes rule;

volume score stubs

to max-down: decrement cur-max-bonus;

to decide which number is pile-score:
	decide on (boolval of sco-picky-trial) + (boolval of sco-pricky-tile)

to decide which number is lamp-score:
	decide on (boolval of sco-keen-lamp) + (boolval of sco-some-oil)

to decide which number is zoo-score:
	decide on (boolval of sco-pottery-wand) + (boolval of sco-speak-well)

to decide which number is woe-cell-score:
	decide on (boolval of sco-oh-swell) + (boolval of sco-so-well)

volume regions

a region has a direction called firstdir. firstdir of a region is usually inside

a region can be solved or unsolved. a region is usually unsolved.

a region has a number called max-score. a region has a number called cur-score. a region has a number called min-needed-score. a region has a table name called spoontable. a region has a room called firstroom.

a region has text called descrip.

a region has a number called maxregscore. a region has a number called curregscore.

hubregion is a region. firstdir of hubregion is up. spoontable of hubregion is table of hub spoonerisms. maxregscore of hubregion is 4.

gonorth is a region. firstdir of gonorth is north. spoontable of gonorth is table of north spoke spoonerisms. descrip of gonorth is "prevent influx of monsters over a dark bridge (north)". maxregscore of gonorth is 10.

gosouth is a region. firstdir of gosouth is south. spoontable of gosouth is table of south spoke spoonerisms. descrip of gosouth is "defeat big bad meanie on a language technicality in the boss fight (south)". maxregscore of gosouth is 8.

goeast is a region. firstdir of goeast is east. spoontable of goeast is table of east spoke spoonerisms. descrip of goeast is "defeat someone who will not attack or annoy with words (east)". maxregscore of goeast is 9.

gowest is a region. firstdir of gowest is west. spoontable of gowest is table of west spoke spoonerisms. descrip of gowest is "rescue animals from a zoo (west)". maxregscore of gowest is 9.

endgame is a region. firstdir of endgame is down. spoontable of endgame is table of endgame spoonerisms. maxregscore of endgame is 9.

definition: a direction (called di) is dirsolved:
	repeat with X running through regions:
		if firstdir of X is di:
			if X is solved, yes;
			no;
	no;

to solve-it (rg - a region):
	now rg is solved;
	change the (firstdir of rg) exit of Ditch Park to nowhere;
	move player to Ditch Park;

Roads Of Liches Definitions ends here.

---- DOCUMENTATION ----
