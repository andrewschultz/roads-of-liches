"Welp Haunted" by Gary Skye

the story headline is "a text adventure for EctoComp 2019".

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

volume regular verbs

instead of sleeping, say "Sleep coming? Keep slumming!"

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

