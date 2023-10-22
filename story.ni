"Roads of Liches" by Gary Skye and Terry Scales

volume includes

[deleted: Gruel Co, Ghoul Crow]

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

section temporary

understand the command "say" as something new.

The print final score rule is not listed in for printing the player's obituary.

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
	if noun is not planar, continue the action;
	repeat with rg running through regions:
		if firstdir of rg is noun:
			if rg is solved, say "You've already taken care of things to [the noun]." instead;
			break;

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

volume north hub

book Meek Spined

Meek Spined is north of Ditch Park. Meek Spined is in gonorth. "[if sco-speak-mind is false]Oh, man! You thought you were brave enough to keep going, but you feel meek-spined. Well, you can always go [gen-dir of south]. Even if baddies may've gotten there by now[else]You feel brave enough here to head north or go back [gen-dir of south][end if]."

check going north in Meek Spined when sco-speak-mind is false: say "You feel awed to silence by the path to the north." instead;

book Roar Fest

Roar Fest is north of Meek Spined. Roar Fest is in gonorth. printed name of Roar Fest is "[if sco-forest is true]Forest[else]Roar Fest[end if]". "[if sco-forest is false]Perhaps there is a path besides back south, but all the roaring is distracting you[else]With the roaring cleared, you see passages west, south and east[end if]."

check going in roar fest when sco-forest is false:
	if noun is rejectable, say "The roaring means you can't think or see which way to go." instead;

book Pale Wrath

Pale Wrath is west of Roar Fest. it is in gonorth. "You can go north or east here[if sco-mill-key is false]. You also hear something[end if]."

chapter kill me

kill me is scenery in Pale Wrath. "The voice could be something more constructive."

check listening when player is in Pale Wrath:
	if kill me is in pale wrath, say "You hear a faint 'Kill me...'" instead;
	say "No more voices." instead;

check going north in pale wrath:
	if sco-rail-path is false, say "You are pushed back by sheer hatred." instead;
	if sco-bending-pole is false, say "You are unable to keep your balance." instead;

chapter mill key

the mill key is a thing. "You can guess what it opens, seeing as it says MILL on the side."

book Um Soil

Um Soil is north of Pale Wrath. printed name is "Um, Soil". it is in gonorth. "Passage leads south and east."

the oil is a thing. "Oil, in a tight container, for when you might need fuel."

book Mating Hill

Mating Hill is east of Roar Fest. it is in gonorth. "[if sco-hating-mill is true]There's a mill here in place of the hill that was to the north. You can go north or west[else]There's a big hill to the north, but you can also go back west[end if]."

check going north in mating hill when sco-hating-mill is false: say "Mating Hill is too high." instead;

after printing the locale description when player is in mating hill (this is the try-opening-mill rule):
	if player has mill key:
		move pending bowl to mating hill;
		say "Your mill key opens up the mill. It's empty, except for a pending bowl, which seems to be phased in halfway.";
		moot mill key;
	continue the action;

chapter pending bowl

the pending bowl is a thing.

chapter bending pole

the bending pole is a thing.

book Lean Camp

Lean Camp is north of Mating Hill. it is in gonorth. "Passages west and south. [if sco-keen-lamp is false]Perhaps someone left something here[else]You've probably found all you could here[end if]."

chapter keen lamp

the keen lamp is a thing. "It's nice and shiny and bright [if oil is moot]and lit, too[else]but not lit, yet[end if]."

book Fear Bridge

Fear Bridge is west of Lean Camp. Fear Bridge is east of Um Soil. it is in gonorth. "The fear bridge runs north/south, and you don't want to cross it. You can only go back [opposite of last-dir], though you can see something to [the last-dir].". printed name is "[if sco-beer-fridge is false]Fear Bridge[else]Beer Fridge[end if]". Fear Bridge is oneway.

chapter grabby shoes

the grabby shoes are a plural-named thing in Fear Bridge. "Some grabby shoes tap-tap about here, just ready to descend on someone who might want to dismantle the fear bridge."

chapter shabby grues

the shabby grues are people. "Shabby grues here don't look too happy with you."

after printing the locale description when shabby grues are not off-stage and shabby grues are not in location of player and sco-pitch-dark is false:
	if grues are in ditch park:
		say "The grues give up on you.";
		move grabby shoes to fear bridge;
		moot shabby grues;
	else:
		say "The shabby grues follow you from [location of shabby grues].";
		move shabby grues to location of player;
	continue the action;

book wayfair cell

Wayfair Cell is a room in endgame.

volume south hub

book Painful Garden

Painful Garden is south of Ditch Park. It is in gosouth.

book Deal Room

Real Doom is a room in gosouth. It is south of Painful Garden. printed name is "[if sco-deal-room is false]Deal Room[else]Real Doom[end if]".

book Dutiful Bawlers

Dutiful Bawlers is a room in gosouth. It is east of Real Doom.

chapter beautiful dollars

the beautiful dollars are a thing.

book Violence Senders

Violence Senders is a room in gosouth. It is west of Real Doom. printed name is "[if sco-silence-vendors is true]Silence Vendors[else]Violence Senders[end if]". "Bend south and east.".

check going south in violence senders:
	unless dollars are moot, say "A vicious roar from the south pushes you back." instead;

after printing the locale description when player is in violence senders (this is the dollars-and-vendors rule):
	if player has dollars and silence vendors are in violence senders and player is in violence senders:
		say "You fork over the dollars to the silence vendors. They nod, pleased. The roar from the south diminishes. You'd feel safe going there now.";
		moot dollars;
	continue the action;

chapter silence vendors

the silence vendors are people.

book Scraped Shoals

Scraped Shoals is a room in gosouth. It is south of Dutiful Bawlers. "Bend south and west.".

book Violence Senders

Hater Graph is a room in gosouth. It is south of Violence Senders.  "Bend north and east. Hoo boy! A hater graph is here. Statistics can be harsh and heartless, but this is something else."

book Testing Jeers Jesting Tears

Testing Jeers Jesting Tears is a room in gosouth. It is east of Hater Graph. It is west of Scraped Shoals. It is oneway. "This is a sandy area. You feel an invisible line dividing you. You don't want to step over it. You can see clearly to [the last-dir], but you probably can only go back [last-dir]."

volume east hub

book fang duels

Fang Duels is a room in goeast. it is east of Ditch Park.

check going in fang duels when sco-dang-fools is false:
	if noun is rejectable, say "No way to push through those fights." instead;

book Screening Pool

Screening Pool is a room in goeast. it is north of Fang Duels.

check going east in Screening Pool when strays are not moot:
	say "You feel an animal unrest pushing you back." instead;

chapter straight as

there is a thing called straight as. printed name is "straight a's". description is "You're not sure what you can do with good grades, if anything.".

chapter eight strays

there is a thing called eight strays. "Eight stray animals potter around here, hoping you can lead them back home, or what passes for it."

book Crazy Leap

Crazy Leap is a room in goeast. it is south of Fang Duels. "A bend north and east.".

check going east in crazy leap when sco-lazy-creep is false: say "A voice seems to shake you and demand life force from you, or someone, before you can pass. You have not made this sacrifice yet." instead;

book Tool Cavern

Tool Cavern is a room in goeast. it is east of Screening Pool. "Bend west and south.". printed name is "[if cavern-is-tavern is true]Cool Tavern[else]Tool Cavern[end if]".

chapter muddy wrench

the muddy wrench is a thing.

chapter ruddy mensch

the ruddy mensch is a person.

book Mass Crime

Mass Crime is a room in goeast. it is east of Crazy Leap. "Bend west and north."

chapter crass mime

the crass mime is a person.

book Tricky Pile

Tricky Pile is a room in goeast. it is south of Tool Cavern. it is north of Mass Crime. "A tricky pile blocks passage [last-dir]. You can see over it, but it's shifty, so no way you can climb over it. You can go back [opposite of last-dir].". Tricky Pile is oneway.

volume west hub

book Night Sludge

Night Sludge is west of Ditch Park. it is in gowest. "[if sco-slight-nudge is false]Ugh, this sludge really leaves you clueless of any way to go except back east[else]You see paths through the sludge to the south and north now and back east as well[end if]."

check going in Night Sludge when sco-slight-nudge is false:
	if noun is rejectable, say "The night sludge has you a bit scared. You're clueless how to start going through it." instead;

book Feeling Harm

Feeling Harm is a room in gowest. it is north of Night Sludge. "[if sco-healing-farm is false]You feel squeezed in by terror. Until that subsides, you can only go back south[else]The healing farm feels more wide open now. You can go west or south[end if]."

check going in feeling harm:
	if sco-healing-farm is false and noun is rejectable, say "You fear harm any way but south." instead;
	if noun is west and creep is not moot, say "The [sheep-creep] won't let you go west. How to get rid of them?" instead;

to decide which thing is sheep-creep:
	if sheep is touchable, decide on sheep;
	decide on creep;

chapter sheddable creep

the sheddable creep is a person.

creep-catch is a truth state that varies.
creep-chase is a truth state that varies.

every turn when sheddable creep is in location of player:
	if creep-catch is true:
		say "The sheddable creep, well, you weren't able to shed them. They bug you a bit, leaving you feeling a bit like a bum. Then they head back to Healing Farm.";
		move creep to feeling harm;
		now creep-chase is false;
	else:
		now creep-catch is true;

after printing the locale description when player is in feeling harm:
	if sheddable creep is in feeling harm and creep-chase is false:
		say "The creep sees you again. There's going to be another chase.";
		now creep-chase is true;
	continue the action;

after printing the locale description when creep-chase is true:
		say "The sheddable creep follows you from [location of sheddable creep].";
		move sheddable creep to location of player;
		now creep-catch is false;
	continue the action;


chapter credible sheep

the credible sheep are plural-named people.

book Blue Tombs

Blue Tombs is a room in gowest. it is south of Night Sludge. "You can go north or west."

the blocking rose is a thing in Blue Tombs. "A blocking rose menacingly guards the way west."

the murky peony is a thing in Blue Tombs. "A murky peony stands next to the blocking rose."

check going west in blue tombs when sco-rocking-blows is false:
	say "That blocking rose is in the way." instead;

the perky meanie is a person.

book Tumorous Home

Tumorous Home is a room in gowest. it is west of Feeling Harm. "A bend with passages south and east."

chapter weak spell

the weak spell is a thing.

book Watery Pond

Watery Pond is a room in gowest. it is west of Blue Tombs. "A bend with passages east and north."

chapter pottery wand

the pottery wand is a thing.

book Trap Zoo

Trap Zoo is a room in gowest. it is south of Tumorous Home. it is north of Watery Pond. Trap Zoo is oneway. "The zoo cuts horizontally. You can only go back [opposite of last-dir], although you see something [last-dir] of the zoo."

chapter Ghoul Crow

the ghoul crow is a thing.

chapter paying gruel

The paying gruel is a thing. "It's a bowl of paying gruel, as thanks for what you did.";

check eating paying gruel:
	say "No. It must become something else." instead;

volume unsorted rooms

volume unsorted things

the weak spell is a thing. "A weak spell lies here. Maybe it's good it isn't powerful, or it might be too much for you."

the greater half is a thing. "This is a relatively benign message about pulling through even when things seem bad."

[Howl Farm is west of Night Sludge. It is in gowest. "A deep cry is here."]

the deep cry is scenery.

[dark heels: HARK DEALS chases them around]

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

book thinking

the block thinking rule is not listed in any rulebook.

check thinking:
	let got-something be false;
	repeat through spoontable of mrlp:
		if idid entry is false and think-cue entry is true:
			now got-something is true;
			if there is a think-advice entry:
				say "[think-advice entry]";
			else:
				say "You tried [b][w1 entry in upper case] [w2 entry in upper case][r][if there is a best-room entry] in [best-room entry][end if], but it didn't quite work out. Maybe later.";
	if got-something is false:
		say "There's nothing you could do later.";
	the rule succeeds;

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

gometa is a region.

nary a void is a room in gometa.

stride seat is a room in gometa.

volume mapping stuff

index map with wayfair cell mapped east of Dutiful Bawlers.

index map with nary a void mapped north of tumorous home.
index map with stride seat mapped north of nary a void.