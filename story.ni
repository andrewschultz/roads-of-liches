"Welp Haunted" by Gary Skye

the story headline is "a text adventure for EctoComp 2020".

Jesse Murney is a person. The player is Jesse Murney.

to die: end the story saying "I do die! Ooh!"

volume rooms

book ditch park

Ditch Park is a room. the toast gown is a wearable thing in Ditch Park.

hop-start is a truth state that varies.

every turn when player is in ditch park and hop-start is false: say "It feels so heart-stopping here. You need a way to move.";

book deal room

Deal Room is a room.

book healing farm

Healing Farm is a room.

book crazy leap

crazy leap is a room. "You hear a deep cry echo through the crazy leap."

The Lazy Creep is a person in Crazy Leap.

chapter keepdrying

keepdrying is an action applying to nothing.

understand the command "keepdry" as something new.

understand "keepdry" as keepdrying.

kept-dry is a truth state that varies.

carry out keepdrying:
	if kept-dry is true, say "You already did." instead;
	say "You keep dry and now have more confidence to say [if creepdie-warn is true]CREEP DIE as you couldn't quite bbfore[else]something bolder[end if].";
	increment the score;
	now kept-dry is true;
	the rule succeeds.

chapter creepdieing

creepdieing is an action applying to nothing.

understand the command "creepdie" as something new.

understand "creepdie" as creepdieing.

creep-died is a truth state that varies.

creepdie-warn is a truth state that varies.

carry out creepdieing:
	if kept-dry is false:
		now creepdie-warn is true;
		say "You don't have the confidence to say that. But you bet it'll work when you do." instead;
	now creepdie-warn is false;
	now creep-died is true;
	increment the score;
	say "The creep dies!";
	moot lazy creep;
	the rule succeeds.

volume regular verbs

the block sleeping rule is not listed in any rulebook.

check sleeping: say "Sleep coming? Keep slumming!" instead;

volume weird verbs

chapter starthopping

starthopping is an action applying to nothing.

understand the command "start hopping" as something new.

understand "start hopping" as starthopping.

carry out starthopping:
	if hop-start is true, say "You already did." instead;
	increment the score;
	say "It's good to feel you can move. You feel less helpless now.";
	the rule succeeds.

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
