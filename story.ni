"Roads of Liches" by Gary Skye and Terry Scales

volume includes

[dark heels: HARK DEALS chases them around]

the story description is "STRAIGHT GORY GREAT STORY".

the story headline is "A straight gory great story for EctoComp 2023 Grand Guignol".

the release number is 1.

release along with cover art.

release along with a website.

release along with the "Parchment" interpreter.

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
	now the right hand status line is "[current-score]/[min-needed][if score is min-needed][else if min-needed is max-available]*[else]-[max-available][end if]";
	force-status;
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

chapter cheat trunk

the cheat trunk is a thing. "A cheat trunk has appeared from the depths of the lie mist.". description is "You [if sco-treat-chunk is true]got a glimpse when it opened the first time, and there are a lot of treat chunks in there[else]can't really see what's in the cheat trunk, but you might be able to guess what's inside it[end if]."

chapter treat chunk

the treat chunk is a thing. "It doesn't look particularly tasty, but if it helps you figure things out, it's probably best not to worry about that."

to say first-of-ors of (x - indexed text):
	replace the regular expression "\|.*" in x with "";
	say "[x]";

a wordguess rule for a table name (called tn) (this is the cheatfind rule):
	repeat through tn:
		process the check-rule entry;
		let rb-out be the outcome of the rulebook;
		if rb-out is not the ready outcome, next;
		say "Mmm. That treat chunk is delicious. Good brain food. It makes you think [b][first-of-ors of w1 entry in upper case][if there is a w2 entry] [first-of-ors of w2 entry in upper case][r][end if]. Seems legit.[line break]";
		now idid entry is true;
		now think-cue entry is false;
		up-which core entry;
		process the run-rule entry;
		now verb-dont-print is false;
		the rule succeeds;

check eating treat chunk:
	now verb-dont-print is true;
	abide by the cheatfind rule for spoontable of mrlp;
	abide by the cheatfind rule for table of item spoonerisms;
	say "There's nothing you can do.";
	now verb-dont-print is false;

chapter toast gown

a toast gown is a wearable thing in Ditch Park.

volume north hub

book Meek Spined

Meek Spined is north of Ditch Park. Meek Spined is in gonorth. "[if sco-speak-mind is false]Oh, man! You thought you were brave enough to keep going, but you feel meek-spined. Well, you can always go [gen-dir of south]. Even if baddies may've gotten there by now[else]You feel brave enough here to head north or go back [gen-dir of south][end if]."

check going north in Meek Spined when sco-speak-mind is false: say "You feel awed to silence by the path to the north." instead;

book Roar Fest

Roar Fest is north of Meek Spined. Roar Fest is in gonorth. printed name of Roar Fest is "[if sco-forest is true]Forest[else]Roar Fest[end if]".

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

volume unsorted rooms

volume unsorted things

the weak spell is a thing. "A weak spell lies here. Maybe it's good it isn't powerful, or it might be too much for you."

the hater graph is a thing. "Hoo boy! A hater graph is here. Statistics can be harsh and heartless, but this is something else."

volume regular verbs

book attacking

the block attacking rule is not listed in any rulebook.

to say trunk-feet: say "It jolts up a foot off the ground. Wait. No. It actually has feet. How about that? "

check closing cheat trunk:
	moot cheat trunk;
	say "You respectfully close the cheat trunk. It understands its service here is done. [trunk-feet]You wave to it as it disappears.";
	chest-bonus;
	the rule succeeds;

check attacking:
	if noun is cheat trunk:
		moot cheat trunk;
		say "You give the cheat trunk a good kicking, to show you don't need it. You think you hear a whimper. [trunk-feet]And feelings, too![paragraph break]Meanie. All that to show you don't need someone or something any more.";
		chest-bonus;
		the rule succeeds;
	say "Gore foe? Forego!" instead;

book dropping

check dropping:
	if noun is treat chunk:
		moot treat chunk;
		say "It drifts off to ... wherever.";
		chest-bonus;
		the rule succeeds;
	say "You don't need to drop anything in [this-game]. Things will disappear once they're used." instead;

book eating

the can't eat unless edible rule is not listed in any rulebook.

understand "eat" as eating.

rule for supplying a missing noun when eating:
	if player has the treat chunk, now noun is treat chunk;

check eating: say "Go nosh? No, gosh! [one of](You don't need to eat anything.)[or][line break][stopping]" instead;

book scoring

the announce the score rule is not listed in the carry out requesting the score rulebook.

to say it-they of (n - a number): say "[if n is 1]it[else]they[end if]";

carry out requesting the score:
	now verb-dont-print is true;
	say "You have scored a total of [current-score] out of [max-overall] points and need [min-needed] to win. You have found [cur-bonus] of [max-bonus] bonus points so far[if bonus-locked-out > 0]. You are locked out of [bonus-locked-out] point[plur of bonus-locked-out][one of]. You can check for the maximum score dropping in the upper right, which usually happens when you take a one-way passage[or][stopping][end if].";
	now verb-dont-print is false;
	continue the action;

book taking

check taking (this is the RoL rejection rule): say "You shouldn't need to [b]TAKE[r] anything explicitly in [this-game]. It will be done for you, if you find the right command." instead;

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
