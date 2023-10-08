"Roads of Liches" by Gary Skye and Terry Scales

volume includes

[dark heels: HARK DEALS chases them around]

the story description is "STRAIGHT GORY GREAT STORY".

the story headline is "A straight gory great story for EctoComp 2023 Grand Guignol".

the release number is 1.

release along with cover art.

release along with a website.

release along with the "parchment" interpreter.

section extra header

include Trivial Niceties by Andrew Schultz.

include Roads of Liches Definitions by Andrew Schultz.

include Roads of Liches Globals by Andrew Schultz.

include Roads of Liches Tables by Andrew Schultz.

include Roads of Liches Tests by Andrew Schultz.

section minor general modules

include Old School Verb Total Carnage by Andrew Schultz.

include Bold Final Question Rows by Andrew Schultz.

volume starting stuff

Jesse Murney is a person. The player is Jesse Murney. description is "You're wearing weird clothes, [if sco-cleared-woes is true]but you no longer feel self-conscious about them[else]and it bugs you more than it should[end if]."

to die: end the story saying "I do die! Ooh!"

when play begins:
	say "Details: you walk through the after-dark dafter ark to...";

volume hub rooms

book ditch park

Ditch Park is a room in hubregion. "[if sco-my-list is false]There is an oppressive lie mist choking you all around[else]The lie mist has dissipated, but it's still not very pleasant here[ditch-park-go][end if].".

to say ditch-park-go:
	say ". You [if number of viable directions > 0]can go [list of viable directions][else]can't seem to go anywhere. There's a puzzle here[end if]";
	if number of solved regions > 0:
		say ". You already took care of things to the [list of dirsolved directions]";

check going when player is in Ditch Park:
	if sco-my-list is false, say "With the lie mist, you can't see your way around, and you wouldn't trust yourself to make way through it." instead;
	if sco-start-hopping is false, say "You don't feel brave enough! The adventure feels so heart-stopping at the moment." instead;

every turn when player is in ditch park and sco-my-list is true and sco-start-hopping is false: say "It feels so heart-stopping here. You need a way to move.";

the lie mist is scenery in Ditch Park. "Ugh! You can't see through it, but it seems to be convincing you it's much thicker than it really is. It makes you feel disorganized, too."

chapter my list

my list is a thing. "It describes the passsages through. You feel a bit more confident and organized just reading it."

chapter toast gown

a toast gown is a wearable thing in Ditch Park.

volume north hub

book Meek Spined

Meek Spined is north of Ditch Park. Meek Spined is in gonorth.

book deal room

Deal Room is a room.

book healing farm

Healing Farm is a room.

book fang duel

Fang Duels is a room.

book crazy leap

Crazy Leap is a room. "You hear a deep cry echo through the crazy leap."

The Lazy Creep is a person in Crazy Leap.

book wayfair cell

Wayfair Cell is a room.

volume south hub

book Painful Garden

Painful Garden is south of Ditch Park. It is in gosouth.

volume east hub

Gruel Co is east of Ditch Park. It is in goeast.

volume west hub

book Night Sludge

Night Sludge is west of Ditch Park. it is in gowest.

check going west in Night Sludge:
	if sco-slight-nudge is false, say "The night sludge has you a bit scared. You're clueless how to start going through it." instead;

book howl farm

Howl Farm is west of Night Sludge. It is in gowest. "A deep cry is here."

the deep cry is scenery in Howl Farm.

chapter Ghoul Crow

the ghoul crow is a thing.

chapter paying gruel

The paying gruel is a thing. "It's a bowl of paying gruel, as thanks for what you did.";

check eating paying gruel:
	say "No. It must become something else." instead;

volume unsorted things

volume regular verbs

book attacking

the block attacking rule is not listed in any rulebook.

check attacking: say "Gore foe? Forego!" instead;

book eating

the can't eat unless edible rule is not listed in any rulebook.

check eating: say "Go nosh? No, gosh! [one of](You don't need to eat anything.)[or][line break][stopping]" instead;

book sleeping

the block sleeping rule is not listed in any rulebook.

check sleeping: say "Sleep coming? Keep slumming!" instead;

book swearing

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
