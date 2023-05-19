"Welp Haunted" by Gary Skye and Terry Scales

volume includes

the story description is "STRAIGHT GORY GREAT STORY".

the story headline is "A straight gory great story for EctoComp 2023 Grand Guignol".

release along with cover art.

release along with a website.

release along with the "parchment" interpreter.

chapter extra header

include Trivial Niceties by Andrew Schultz.

include Welp Haunted Globals by Andrew Schultz.

include Welp Haunted Tables by Andrew Schultz.

include Welp Haunted Tests by Andrew Schultz.

volume you the player

Jesse Murney is a person. The player is Jesse Murney. description is "You're wearing weird clothes."

to die: end the story saying "I do die! Ooh!"

volume rooms

book ditch park

Ditch Park is a room. the toast gown is a wearable thing in Ditch Park.

every turn when player is in ditch park and sco-start-hopping is false: say "It feels so heart-stopping here. You need a way to move.";

book deal room

Deal Room is a room.

book healing farm

Healing Farm is a room.

book howl farm

Howl Farm is a room. "A deep cry is here."

the deep cry is scenery in Howl Farm.

book crazy leap

crazy leap is a room. "You hear a deep cry echo through the crazy leap."

The Lazy Creep is a person in Crazy Leap.

volume unsorted things

volume regular verbs

the block sleeping rule is not listed in any rulebook.

check sleeping: say "Sleep coming? Keep slumming!" instead;

the block swearing obscenely rule is not listed in any rulebook.
the block swearing obscenely rule is not listed in any rulebook.

check swearing mildly:
	try swearing obscenely instead;

check swearing obscenely:
	say "Yelps! Who helps you?!" instead;

volume weird verbs

chapter endspiteing

endspiteing is an action applying to nothing.

understand the command "end spite" as something new.

understand "end spite" as endspiteing.
understand "end the spite" as endspiteing.

carry out endspiteing:
	say "Yes, it's time. Time to move on.";
	increment the score;
	end the story finally;
	the rule succeeds.

volume meta

to moot (x - a thing): move x to nary a void;

definition: a thing (called th) is moot:
	if th is in nary a void, yes;
	no;

nary a void is a room.
