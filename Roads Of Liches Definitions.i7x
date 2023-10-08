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

volume regions

a region has a direction called firstdir.

a region can be solved or unsolved. a region is usually unsolved.

a region has a number called max-score. a region has a number called cur-score. a region has a number called min-needed-score. a region has a table name called spoontable. a region has a room called firstroom.

hubregion is a region. firstdir of hubregion is up.

gonorth is a region. firstdir of gonorth is north. spoontable of gonorth is table of north spoke spoonerisms.

gosouth is a region. firstdir of gosouth is south. spoontable of gosouth is table of south spoke spoonerisms.

goeast is a region. firstdir of goeast is east. spoontable of goeast is table of east spoke spoonerisms.

gowest is a region. firstdir of gowest is west. spoontable of gowest is table of west spoke spoonerisms.

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
