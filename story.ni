"Roads of Liches" by Gary Skye and Terry Scales

volume includes

[deleted: Gruel Co, Ghoul Crow]

the story description is "STRAIGHT GORY GREAT STORY".

the story headline is "A straight gory great story for EctoComp 2023 Grand Guignol".

the release number is 1.

release along with cover art.

release along with a website.

release along with the "Parchment" interpreter.

section general headers

include Trivial Niceties by Andrew Schultz.

include Punctuation Stripper by Andrew Schultz.

include Intro Restore Skip by Andrew Schultz.

include Old School Verb Total Carnage by Andrew Schultz.

include Bold Final Question Rows by Andrew Schultz.

section game specific

include Roads of Liches Definitions by Andrew Schultz.

include Roads of Liches Globals by Andrew Schultz.

include Roads of Liches Mistakes by Andrew Schultz.

include Roads of Liches Tables by Andrew Schultz.

include Roads of Liches Tests by Andrew Schultz.

volume game specific verb and rule zapping

understand the command "say" as something new.

The print final score rule is not listed in for printing the player's obituary.

volume remove before final release - not for release

[include Property Checking by Emily Short

a thing can be abstract.]

volume starting stuff

to die: end the story saying "I do die! Ooh!"

when play begins:
	now the right hand status line is "[current-score]/[min-needed][if score is min-needed][else if min-needed is max-available]*[else]-[max-available][end if]";
	force-status;
	say "Alas, dear reader, the intro needs a boost. I was so busy putting the puzzles together.[paragraph break]But this is the gist: spooky spooky Halloween. You note an after-dark dafter ark. You are promised loads of riches ... and you walk through. There are roads -- empty at first, but then liches run you off them, to a park...";

volume hub rooms

book ditch park

Ditch Park is a room in hubregion. "[if sco-my-list is false]There is an oppressive lie mist choking you all around. You don't trust yourself to find your way until it's lifted, but how?[else]The lie mist has dissipated, but it's still not very pleasant here[ditch-park-go][lamp-note].[end if]".

to say lamp-note: if sco-pitch-dark is true, say ". The keen lamp you left hanging from the bending pole is keeping things lit nicely"

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
			if rg is not solved, continue the action;
			if noun is west or noun is east:
				say "While you took care of things to [the noun], it is interconnected with another sector.";
				continue the action;
			say "You've already taken care of things to [the noun]." instead;

every turn when player is in ditch park and sco-my-list is true and sco-start-hopping is false: say "It feels so heart-stopping here. You need a way to move.";

chapter you uh me

Jesse Murney is a person in Ditch Park. The player is Jesse Murney. description is "You, Jesse Murney, are wearing weird clothes, [if sco-cleared-woes is true]but you no longer feel self-conscious about them[else]and it bugs you more than it should[end if]."

chapter lie mist

the lie mist is scenery in Ditch Park. "Ugh! You can't see through it, but it seems to be convincing you it's much thicker than it really is. It makes you feel disorganized, too."

chapter my list

my list is a thing. "It describes the passsages through. You feel a bit more confident and organized just reading it.". printed name of my list is "'my list'". description is "Your list has a few tasks that will help you get mauled scraps that will make a scrawled map.".

to decide which number is nsr: decide on number of solved regions;

report taking inventory when my list is not moot:
	if nsr is 0:
		say "You haven't found any mauled scraps yet.";
	else:
		say "You have also found [nsr in words] mauled scrap[if nsr > 1]s[end if].";

report examining my list:
	repeat with mrg running through regions:
		if firstdir of mrg is not planar, next;
		say " * [descrip of mrg][if mrg is solved] (DONE!) [end if][line break]";
	continue the action;

chapter cheat trunk

the cheat trunk is a thing. "A cheat trunk sits here. [if sco-treat-chunk is false]What could be in it?[else]You got a treat chunk from it, but there's more if needed.[end if]". description is "You [if sco-treat-chunk is true]got a glimpse when it opened the first time, and there are a lot of treat chunks in there[else]can't really see what's in the cheat trunk, but you might be able to guess what's inside it[end if]."

check opening cheat trunk: say "[trunk-open-close]." instead;
check closing cheat trunk: say "[trunk-open-close]." instead;

to say trunk-open-close: say "No need to open or close the cheat trunk. You can just take [if sco-treat-chunk is false]whatever might appear in it[else]a treat chunk as needed[end if]";

chapter treat chunk

the treat chunk is scenery. "Well, it doesn't look like a super-duper candy bar, but it is tasty and tempting enough. It reminds you of stomachaches you couldn't avoid in Halloweens past when you would gorge yourself on all the good candy, leaving the wack stuff for later."

report examining treat chunk:
	if chunk-warn is false:
		say "Can you resist it now? And what is the reward if you do?";
	else:
		say "You already ate one. You feel slight vague guilt. But it helped you move forward.";
	continue the action;

to say first-of-ors of (x - indexed text):
	replace the regular expression "\|.*" in x with "";
	say "[x]";

chunk-warn is a truth state that varies.

a wordguess rule for a table name (called tn) (this is the cheatfind rule):
	repeat through tn:
		process the check-rule entry;
		let rb-out be the outcome of the rulebook;
		if rb-out is not the ready outcome, next;
		say "Mmm. That treat chunk is delicious. Good brain food. It makes you think [b][first-of-ors of w1 entry in upper case][if there is a w2 entry] [first-of-ors of w2 entry in upper case][r][end if]. Seems legit.[paragraph break]";
		now idid entry is true;
		now think-cue entry is false;
		up-which core entry;
		process the run-rule entry;
		now verb-dont-print is false;
		move treat chunk to ditch park;
		max-down;
		if chunk-warn is false:
			say "[line break](By the way, you can [b]TAKE CHUNK[r] again, if you want[if player is not in ditch park], back at ditch park[end if]. The cheat trunk is pretty big.)";
			now chunk-warn is true;
		the rule succeeds;

check eating treat chunk:
	now verb-dont-print is true;
	abide by the cheatfind rule for spoontable of mrlp;
	abide by the cheatfind rule for table of item spoonerisms;
	say "There's nothing you can do here now.";
	now verb-dont-print is false;
	the rule succeeds;

volume north hub

book Cold Barrier

Cold Barrier is north of Ditch Park. Cold Barrier is in gonorth. "[if sco-bold-carrier is false]A cold barrier blocks you to the north. Well, you can always go [gen-dir of south]. Even if baddies may've gotten there by now[else]The ground has transformed into a sort of grounded aircraft carrier. The cold barrier it replaced is no longer around. You can also go [gen-dir of south][end if].". printed name is "[if sco-bold-carrier is false]Cold Barrier[else]Bold Carrier[end if]"

check going north in Cold Barrier when sco-bold-carrier is false: say "It feels even colder to the north." instead;

book Roar Fest

Roar Fest is north of Cold Barrier. Roar Fest is in gonorth. printed name of Roar Fest is "[if sco-forest is true]Forest[else]Roar Fest[end if]". "[if sco-forest is false]Perhaps there is a path besides back south, but all the roaring is distracting you from finding it[else]With the roaring cleared, you see passages west, south and east[end if]."

check going in roar fest when sco-forest is false:
	if noun is rejectable, say "The roaring means you can't think or see which way to go." instead;

book Pale Wrath

Pale Wrath is west of Roar Fest. it is in gonorth. "[if sco-rail-path is false]There's a huge chasm to the north[else]You made a rail path north[end if], though you can go back east, too[if sco-mill-key is false]. You also hear something[end if].". printed name is "[if sco-rail-path is true]Rail Path[else]Pale Wrath[end if]"

chapter kill me

kill me is scenery in Pale Wrath. "The voice could be something more constructive."

check listening when player is in Pale Wrath:
	if kill me is in pale wrath, say "You hear a faint 'Kill me...'" instead;
	say "No more voices." instead;

check going north in pale wrath:
	if sco-rail-path is false, say "You'd fall to your death." instead;
	if sco-bending-pole is false, say "You are unable to keep your balance." instead;

chapter mill key

the mill key is a thing. description is "You can guess what it opens, seeing as it says MILL on the side."

book Um Soil

Um Soil is north of Pale Wrath. printed name is "Um, Soil". it is in gonorth. "This is, thankfully, a relatively nondescript location[if sco-some-oil is false], but who knows what might be buried beneath? [else], but finding the oil was nice. [end if]You can go south and east."

the oil is a thing. description is "Oil, in a tight container, for when you might need fuel."

book Mating Hill

Mating Hill is east of Roar Fest. it is in gonorth. "[if sco-hating-mill is true]There's a mill here in place of the hill that was to the north. You can go north or west[else]There's a big hill to the north, too big to climb, but you can also go back west. As for what mating occurs, you aren't sure you want to know what or who is mating, or if it is where helpless people get checkmated[end if].". printed name is "[if sco-hating-mill is true]Hating Mill[else]Mating Hill[end if]".

check going north in mating hill when sco-hating-mill is false: say "Mating Hill is too high." instead;

after printing the locale description when player is in mating hill (this is the try-opening-mill rule):
	if player has mill key:
		move pending bowl to mating hill;
		say "Your mill key opens up the mill. It's empty, except for a pending bowl, which seems to be phased in halfway.";
		moot mill key;
	continue the action;

chapter pending bowl

the pending bowl is a thing. "A pending bowl sits here.". description is "It's weird. It's sort of half there and half not. Like it should be something else."

chapter bending pole

the bending pole is scenery. description is "[if sco-pitch-dark is true]It fits snugly between two trees here in the park, holding the keen lamp[else]It reminds you of what people in a circus hold to balance[end if]."

book Lean Camp

Lean Camp is north of Mating Hill. it is in gonorth. "Barren and desolate here. Passages west and south. [if sco-keen-lamp is false]Perhaps someone left something here, but what?[else]You can't really expect to find more than the keen lamp.[end if]"

chapter keen lamp

the keen lamp is a scenery. "It's nice and shiny and bright [if oil is moot]and lit, too[else]but not lit, yet[end if][if sco-pitch-dark is true]. It's keeping Ditch Park nice and lit and safe from the shabby grues[end if]."

book Fear Bridge

Fear Bridge is west of Lean Camp. Fear Bridge is east of Um Soil. it is in gonorth. "[if sco-beer-fridge is true]By the beer fridge, people come and go, which is nice and relaxing, but you don't have time for that. You can go east or west[else]The fear bridge splits this area north/south, and you don't want to cross or even touch it. You can only go back [opposite of last-dir], though you can see something to [the last-dir][end if].". printed name is "[if sco-beer-fridge is false]Fear Bridge[else]Beer Fridge[end if]". Fear Bridge is oneway.

chapter grabby shoes

the grabby shoes are a plural-named thing in Fear Bridge. "Some grabby shoes tap-tap about here, just ready to descend on someone who might want to dismantle the fear bridge.". description is "If you get too close, you know they'll close in on your fingers or whatever. Certainly not lethal but annoying in volume. They also seem to hide a much darker nature."

chapter shabby grues

the shabby grues are people. "Shabby grues here look around, chasing forlornly. Thankfully, you can stay in the moonlight, so they can't attack.". description is "You don't want to get too close where they'd feel comfortable grabbing you."

after printing the locale description when shabby grues are not off-stage and shabby grues are not in location of player and sco-pitch-dark is false:
	if grues are in ditch park:
		say "The grues give up on you.";
		move grabby shoes to fear bridge;
		moot shabby grues;
	else:
		say "The shabby grues follow you from [location of shabby grues].";
		move shabby grues to location of player;
	continue the action;

volume south hub

book Painful Garden

Painful Garden is south of Ditch Park. It is in gosouth. "[if sco-gainful-pardon is false]You feel bad about wanting to go further south. Plus, it looks really thorny that way. You remember trespassing in neighbors['] flower beds when you were five to cut through to a park. The memory hurts[else]You feel up to going south now that you've forgiven yourself for indiscretions when you were five[end if]. You can also go back north to Ditch Park.". printed name is "[if sco-gainful-pardon is true]Gainful Pardon[else]Painful Garden[end if]".

book Deal Room

Real Doom is a room in gosouth. It is south of Painful Garden. printed name is "[if sco-deal-room is true]Deal Room[else]Real Doom[end if]". "[if sco-deal-room is false]Ugh! You feel a sense of foreboding you can't negotiate from any direction except back north[else]The deal room has opened up passages north, west and east[end if]."

book Dutiful Bawlers

Dutiful Bawlers is a room in gosouth. It is east of Real Doom. "The whining here is really too much! People seem to have given up on happiness. They complain about all sorts of things, such as others who may or may not slightly mispronounce words. Fortunately, nobody has the energy to stop you ditching them to the south or east."

chapter beautiful dollars

the beautiful dollars are a plural-named thing. description is "You can't look at them too long, or you'll succumb to the love of money that will make you the sort of undead that hovers restlessly here. Best to just find someone to barter them with."

book Violence Senders

Violence Senders is a room in gosouth. It is west of Real Doom. printed name is "[if sco-silence-vendors is true]Silence Vendors[else]Violence Senders[end if]". "[if sco-silence-vendors is false]You feel oppressed by unseen forces[else]It's more businesslike here with the violence senders pushed back[end if]. You see passage back east and[if silence vendors are not moot], though it strikes fear in you,[end if] south."

check going south in violence senders:
	unless dollars are moot, say "Alas, the violence senders, hidden to the south, do their thing again. You don't feel equipped to push through all the noise and turbulence." instead;

after printing the locale description when player is in violence senders (this is the dollars-and-vendors rule):
	if player has dollars and silence vendors are in violence senders and player is in violence senders:
		say "You fork over the beautiful dollars to the silence vendors. They nod, pleased. The roar from the south diminishes. You'd feel safe going there now.";
		moot dollars;
	continue the action;

chapter silence vendors

the silence vendors are plural-named people. "Silence vendors stand here, offering no enthusiastic sales pitch. You'd like a bit of silence, but the main issue here is scrying what sort of payment they accept.". description is "The silence vendors seem to want to sell you something, but you're not sure what method of payment they'd take. It'd be hypocritical for them to describe in detail, too."

book Scraped Shoals

Scraped Shoals is a room in gosouth. It is south of Dutiful Bawlers. "This shoreline bends from the north to the west. Perhaps it was rich with treasure once, but now [if sco-shaped-scrolls is true]you probably got the last of it.[else]not much is likely left. Still, who knows what you'll find if you know what to look for?[end if]".

chapter shaped scrolls

some shaped scrolls are a plural-named thing. description is "[if sco-greater-half is true]Great wisdom is contained herein, of how to win an argument without being a jerk, even if you are in the wrong[else]They are weirdly shaped, with all the good bits of writing cut off. If only you could find a complementary bit to fill in[end if]!"

book Violence Senders

Hater Graph is a room in gosouth. It is south of Violence Senders.  "A monstrously large hater graph spans the south and west edges. [if sco-greater-half is false]You've deduced why it's inaccurate, now, so you feel less uncomfortable[else]Hoo boy! Statistics can be harsh and heartless, but this is something else[end if]. You can go north and east."

chapter greater half

the greater half is a thing. description is "This is a relatively benign message about pulling through even when things seem bad."

book Driving Rain

Driving Rain is a room in gosouth. It is east of Hater Graph. It is west of Scraped Shoals. It is oneway. "[if sco-muppet-pastor is true]The drain is less intimidating now. You can go east or west over it as you need[else if sco-riving-drain is false]Ugh! With all this driving rain, you can't see clearly. As-is, you can only play it safe and go back [last-dir][else]A riving drain cuts north-south through the center of this plain, which means you're not making it [opposite of last-dir]. You'll just have to go back [last-dir][end if].". printed name is "[if sco-riving-drain is true]Riving Drain[else]Driving Rain[end if]".

chapter puppet master

The puppet master is a person. "A large puppet master stands by the riving drain, gloating they are totally unchangeable, and if they were, they couldn't be changed into something fuzzy and lovable. You won't be getting past them.". description is "Bigger, stronger and louder than you. They obviously pull the strings in realms physical and spiritual. How could they be laid low?"

volume east hub

book fang duels

Fang Duels is a room in goeast. it is east of Ditch Park. description is "[if sco-dang-fools is false]You can't push forward through all the fighting to the side. As-is, you can only go back west[else]With the foolish fighting confined to various corners, you can now easily go north and south as well as back west[end if]."

check going in fang duels when sco-dang-fools is false:
	if noun is rejectable, say "No way to push through those fights." instead;

book Screening Pool

Screening Pool is a room in goeast. it is north of Fang Duels. "[if sco-preening-school is true]The preening school has exits south and east[else]You're not sure what the pool here is screening. It extends to the east. You can go back south[end if].". printed name is "[if sco-preening-school is true]Preening School[else]Screening Pool[end if]".

check going east in Screening Pool:
	if sco-preening-school is false, say "The screening pool gets deeper as you walk out east some more. There's no way to swim through it." instead;
	if sco-eight-strays is false,  say "You try to go east, but suddenly the straight A's start weighing very heavily on you. You almost feel guilty to have them on your person, as if you were showing off. You can't just go dropping them, but how to get rid of them?" instead;
	if tool cavern is unvisited, say "You step gingerly, worried the straight A's rubbed off on you. But you are not impeded.";

chapter straight as

there is a thing called straight as. printed name is "straight a's". description of straight as is "You're not sure what you can do with good grades, if anything. They are almost more like a scarlet letter.".

chapter eight strays

there is a thing called eight strays. "Eight stray animals potter around here, glad you led them to a new home.". description is "They seem happy here, each a sort of weird hybrid of animals you know."

book Crazy Leap

Crazy Leap is a room in goeast. it is south of Fang Duels. "The path bends here. It falls off sharply in every direction except north and east.".

check going in crazy leap:
	if noun is south or noun is west, say "You don't want your final words to be 'Clays! Eee! Reap!'" instead;
	if noun is east and sco-lazy-creep is false, say "A voice seems to shake you and demand life force from you, or someone, before you can pass. You have not made this sacrifice yet." instead;

book Tool Cavern

Tool Cavern is a room in goeast. it is east of Screening Pool. "[if muddy wrench is moot]You can go back west, or you can go south through the passage the ruddy mensch created[else if cavern-is-tavern is true]The tavern exit is west[else]You're [toolcav]. You can exit back west[end if].". printed name is "[if cavern-is-tavern is true]Cool Tavern[else]Tool Cavern[end if]".

to say toolcav:
	if sco-cool-tavern is false:
		say "in a cavern, where many tools gleam, but you can't help thinking a more reliable, well-worn one is what you need. You've no clue yet what it could be";
	else if sco-muddy-wrench is true:
		say "in a cavern where no tools seem as valuable as the muddy wrench";
	else:
		say "in a cavern that gleams with reflections of new tools. But perhaps you need an old reliable one.";

chapter muddy wrench

the muddy wrench is a thing. description is "It looks serviceable."

chapter ruddy mensch

the ruddy mensch is a person. "A ruddy mensch paces around. 'Where is that tool of mine? It's like it's both here and not here at the same time.". description is "The ruddy mensch frowns at you. 'I hate to intrude, but I've turned this place inside out and can't find a tool I need. I'd say what it is, but I'm embarrassed it's so useful to me. There are others bigger and shinier.'"

book Mass Crime

Mass Crime is a room in goeast. it is east of Crazy Leap. "The path bends west and north here. [if sco-crass-mime is true]Well, okay, you can go east or south, but it's really seedy. You'd reach a bad end[end if]."

check going north when player is in mass crime:
	if mime is moot, say "You walk north unimpeded, though you doubt you have anything to do there.";
	if sco-crass-mime is false, say "I should have a better reason to restrict this later. You have something to do here." instead;
	if pile-status is 0, say "The mime follows you north and looks at the tricky pile. They shrug as if to say, what is the big deal? Then they pull you back. They make mock-sleeping gestures, as if to say, that's not very interesting. They can't make a performance out of that!" instead;
	if pile-status is 1:
		if mime-trial is true, say "You already put the mime on trial." instead;
		say "You walk north to a trial where the mime overreacts to judgement thrown down on them.";
		now mime-trial is true;
	if pile-status is 2:
		if mime-tile is true, say "You already at the mime step on the pricky tile." instead;
		say "You walk north to the pricky tile, where the mime jumps around in pain. Those spiky bumps hurt!";
		now mime-tile is true;
	abide by the mime-map rule;

this is the mime-map rule:
	if mime-trial is true and mime-tile is true:
		say "The mime slumps over. They've taken too much! As they fall over, a mauled scrap flies up from their hands. You take it. They express astonishment and run off, fake-crying. But you swear they winked at you as they looked back.[paragraph break]Hooray for a new scrap, but you officially feel emotionally blackmailed into putting up with mimes much longer than you thought you had to, for the next few years.";
		solverg;
		now tricky pile is oneway;
	else:
		say "The mime raises one finger. There is still more they can do to the north!";
	the rule succeeds;

check going west when player is in mass crime and mime is in mass crime: say "The mime mockingly shoos you away, taps a fake watch, then signals for you to come back. Later, you suppose.";

chapter crass mime

the crass mime is a person. "The crass mime dances around here, making slightly tacky gestures, blocking your way north.". description is "The mime smiles and waves at you."

book Tricky Pile

Tricky Pile is a room in goeast. it is north of Mass Crime. "A tricky pile blocks passage [last-dir]. You can see over it, but it's shifty, so no way you can climb over it. [pile-status].[paragraph break]You can go back [opposite of last-dir].". Tricky Pile is oneway. printed name is "[if pile-status is 2]Pricky Trial[else if pile-status is 1]Pricky Tile[else]Tricky Pile[end if]".

to say pile-status:
	if pile-score is 0:
		say "The pile's so tricky, you bet it could change into a couple other things";
	else if pile-score is 1:
		say "You changed the pile to [if sco-picky-trial is true]a picky trial[else]pricky tile[end if], but it seems it could be even more fungible";
	else:
		say "You imagine you could re-shift the pile back to the [if pile-status is 2]picky trial[else]pricky tile[end if] without much trouble if needed"

volume west hub

book Night Sludge

Night Sludge is west of Ditch Park. it is in gowest. "[if sco-slight-nudge is false]Ugh, this sludge really leaves you clueless of any way to go except back east[else]You see paths through the sludge to the south and north now and back east as well[end if]."

check going in Night Sludge when sco-slight-nudge is false:
	if noun is rejectable, say "The night sludge has you a bit scared. You're clueless how to start going through it." instead;

book Feeling Harm

Feeling Harm is a room in gowest. it is north of Night Sludge. "[if sco-healing-farm is false]You feel squeezed in by terror. Until that subsides, you can only go back south[else]The healing farm feels more wide open now. You see a passage west in addition to the one back south now[end if].". printed name is "[if sco-healing-farm is true]Healing Farm[else]Feeling Harm[end if]".

check going in feeling harm:
	if sco-healing-farm is false and noun is rejectable, say "You fear harm any way but south." instead;
	if noun is west and creep is not moot, say "The [sheep-creep] won't let you go west. How to get rid of them?" instead;

to decide which thing is sheep-creep:
	if sheep is touchable, decide on sheep;
	decide on creep;

chapter sheddable creep

the sheddable creep is a person. "The sheddable creep saunters around.". description is "Not the nicest, but they also seem a bit disinterest. You wonder how you could stoke further disinterest."

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
	if creep is not in the location of the player:
		say "The sheddable creep follows you from [location of sheddable creep].";
		move sheddable creep to location of player;
		now creep-catch is false;
	continue the action;

chapter credible sheep

the credible sheep are plural-named people. "Some credible sheep mill around here. They look the part, but they're a bit aggressive.". description is "Looking closer, you expect that their true nature hasn't been revealed."

book Blue Tombs

Blue Tombs is a room in gowest. it is south of Night Sludge. "[if sco-two-blooms is false]Blue tombs rise up in many directions. More specifically, some block a promising passage west[else]You see a passage west where some blue tombs were[end if]. Also, you can go back north.". printed name is "[if sco-two-blooms is false]Blue Tombs[else]Two Blooms[end if]".

check going west in blue tombs when sco-rocking-blows is false:
	say "That blocking rose won't let you by." instead;

chapter blocking rose

the blocking rose is a thing. "A blocking rose menacingly guards the way west for the moment, though[if peony is in tombs], with a murky peony next to it[end if].". description is "The way its petals are organized, it seems almost to be grimacing at you.";

chapter murky peony

the murky peony is scenery. "It seems full of potential misdirected anger."

chapter perky meanie

the perky meanie is a person. "That perky meanie you summoned seems to have made things worse. Seems.". description is "Ugh! Smugness. You don't want to chase them away, and they're probably too big for you."

book Tumorous Home

Tumorous Home is a room in gowest. it is west of Feeling Harm. "A tumorous home blocks out the south and west here, with its odd bulging shape. Passages bend east and south."

chapter weak spell

the weak spell is a thing. description is "[if sco-speak-well is false]Maybe it's good it isn't powerful, or it might be too much for you. You imagine casting it. How could you practice[else]The weak spell makes sense now you can speak well. It seems to have practical applications. Now, where to use it[end if]?"

book Watery Pond

Watery Pond is a room in gowest. it is west of Blue Tombs. "A pond blocks passage all ways both north and west, but it's so nice and clean and non-sludgy, you're grateful it's helping you focus on where you really need to go[if sco-pottery-wand is false]. You wonder, somewhat greedily, if there is anything beneath it for you[end if]."

chapter pottery wand

the pottery wand is a thing. description is "Rather plain looking.  No inscriptions clue the sort of magic it can perform."

book Trap Zoo

Trap Zoo is a room in gowest. it is south of Tumorous Home. it is north of Watery Pond. Trap Zoo is oneway. "[if sco-zap-true is false]A trap zoo holds animals against their will here, making an east-to-west barrier. You can only go back [opposite of last-dir], although you see a passage [last-dir] of the zoo[else]With the trap zoo opened, you can freely walk north and south here[end if]."

volume unsorted rooms

volume unsorted things

[chapter Ghoul Crow

the ghoul crow is a thing.

chapter paying gruel

The paying gruel is a thing. "It's a bowl of paying gruel, as thanks for what you did.";

check eating paying gruel:
	say "No. It must become something else." instead;]

[Howl Farm is west of Night Sludge. It is in gowest. "A deep cry is here."]

[the deep cry is scenery.]

[dark heels: HARK DEALS chases them around]

volume endgame

book woe cell

Woe Cell is a room in endgame. "You feel so woeful here in this pit! [if sco-so-well is false]You haven't even begun to cope. Once you do, maybe[else if sco-oh-swell is false]You've started coping a bit more. You feel confident[else]Despite, or because of, how it's no longer quiet,[end if] you will figure out a way to climb way up, where it seems like there's an exit. There's not much else to do here.". printed name is "[if sco-so-well is false]Woe Cell[else if sco-oh-swell is false]So, Well...[else]Oh, Swell...[end if]".

check going in woe cell:
	if noun is up, say "You need something to climb on. You'll take anything, weird or normal, but you haven't found it yet." instead;
	say "You can't just walk out of this pit. You see an exit way up, but you can't make it on your own." instead;

every turn when player is in woe cell and sickening thuds are in woe cell: say "Those sickening thuds just won't let up!"

chapter sickening thuds

the sickening thuds are scenery. "Thinking about the thuds too much gives a headache. How can you get rid of them or change them?"

book wayfair cell

Wayfair Cell is a room in endgame. "[if sco-revolving-door is false]Oh no! Once again, you feel trapped, and there's no way to climb out this time! There's also a constantly devolving roar. Just when you think it's gone, it starts up again[else]There's a revolving door here, but it'd be rude to exit without a proper word[end if]."

check going outside in Wayfair Cell: say "You try to exit the revolving door but end up where you were. Perhaps you need a magic word." instead;

check entering revolving door: try going outside instead;

the devolving roar is scenery in wayfair cell. "It's annoying. It's very cyclical, too."

the revolving door is scenery. "It won't budge! Perhaps you need a word with it."

check going in wayfair cell:
	if revolving door is not in wayfair cell, say "You haven't made a way out yet." instead;
	say "You aren't sure which way to go. Besides, it would feel rude to leave without a word for whoever put you here. Even a snarky one." instead;

check entering revolving door: try going north instead;

book Bane Row

Bane Row is a room in endgame. "[if sco-speak-mind is false]It's obviously totally hopeless here and nothing can cheer up your day. Right?! Right?[else]You feel this could be adjacent to somewhere more life-affirming, if you just think for a second.[end if][paragraph break]All normal ways out seem to lead to gloom and doom."

check going in Bane Row:
	say "You'd need something special and cheery and bright to REALLY get out of here." instead;

book Near My Claim

Near My Claim is a room in endgame. "You must be near the treasure. You can just feel it![paragraph break][if sco-stop-caring is false]Oh, man! You know you're near the treasure! And yet, you don't feel you deserved it. After all, you destroyed a zoo, tore up a puppet, intimidated some grues, and caused a mime pain. Oh, and that creep chasing you is bummed at the time you made them waste. You feel like a horrible person, someone who doesn't deserve treasure[else]You've got silly bad thoughts out of your head, but you have one more procedural thing to do[end if].";

check going in Near My Claim: say "No running from all these serious issues!" instead;

chapter top scaring

top scaring is scenery in Near My Claim. "The more you ponder the top scaring, the worse it gets. How to disengage?"

every turn when player is in near my claim and top scaring is in near my claim: say "The top scaring really gets into your soul! You wonder if there is any way to zone it out.";

book final bit

table of final question options (continued)
final question wording	only if victorious	topic	final response rule	final response activity
"see the points you [b]MISSED[r]"	true	"missed/misses"	show-misses rule	--

this is the show-misses rule:
	if sco-cleared-woes is false, say "You could have, on seeing your weird clothes, [b]CLEARED WOES[r].";
	if sco-treat-chunk is false:
		say "You could have, on seeing the cheat trunk, gotten a [b]TREAT CHUNK[r].";
	else if chunk-warn is true:
		say "You could've gotten another bonus point for not using the treat chunk."

volume regular action verbs

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

book taking

the RoL rejection rule is listed instead of the can't take scenery rule in the check taking rules.

check taking (this is the RoL rejection rule):
	if player has noun, say "But you already have [the noun]." instead;
	if noun is treat chunk:
		say "[if player has chunk]Grow! Need no greed! (Use what you have, first.)[else]The trunk refills itself.[end if]";
		continue the action;
	if noun is pending bowl, say "There's no meal ahead. The bowl doesn't seem useful in its current state." instead;
	if noun is lamp or noun is bending pole, say "No, [the noun] will help to repel the shabby grues." instead;
	say "You don't need to [b]TAKE[r] anything explicitly in [this-game]. It will be done for you, if you find the right command." instead;

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

volume meta verbs

chapter abouting

abouting is an action out of world.

understand the command "about" as something new.

understand "about" as abouting.

carry out abouting:
	say "Placeholder. Written for 2023 EctoComp Grand Guignol. It's sort of a companion to Trail Stash, written in twine for IFComp 2023. I'd had the idea originally for EctoComp 2018 (!) but didn't want to parcel it out too quickly before I had a less niche-y effort. I hope the contrast of spoonerisms in a parser and choice environment are interesting to you, if you are able to play both. They were for me.";
	say "[line break]https://github.com/andrewschultz/roads-of-liches is the repo, for bugs, etc.";
	say "[line break]This is the second in my [i]I Heart High Art[r] series, [i]Trail Stash[r] being the first.";
	the rule succeeds;

chapter creditsing

creditsing is an action out of world.

understand the command "credits" as something new.

understand "credits" as creditsing.

carry out creditsing:
	say "Oh hi Club Floyd! Thanks so much. Seriously. Sorry about the unimplemented items. I work from puzzles to details.";
	the rule succeeds;

chapter layouting

layouting is an action out of world.

understand the command "layout" as something new.
understand the command "outlay" as something new.
understand the command "lay out" as something new.
understand the command "out lay" as something new.

understand "lay out" as layouting.
understand "out lay" as layouting.
understand "lay out" as layouting.
understand "out lay" as layouting.

carry out layouting:
	say "The layout of [this-game] is as follows:[paragraph break]";
	say "* The main area, minus the endgame, fits onto a 5x7 rectangle.";
	say "* It is symmetrical horizontally and vertically.";
	say "* It is divided into four areas, which are rotations of the other.";
	say "* In the centerpiece room, so to speak, you can only exit the way you came.";
	the rule succeeds;

chapter maping

maping is an action out of world.

understand the command "map" as something new.

understand "map" as maping.

to say ast of (rm - a room): say "[if location of player is rm]U[else if rm is visited]*[else] [end if]";

to say vert of (rm - a room): say "[if rm is visited]|[else] [end if]";

to say horiz of (rm - a room): say "[if rm is visited]-[else] [end if]";

to say vertbin of (ts - a truth state): say "[if ts is true]|[else] [end if]";

to say horizbin of (ts - a truth state): say "[if ts is true]-[else] [end if]";

carry out maping:
	if sco-my-list is false, say "Nothing to map, yet." instead;
	say "[fixed letter spacing]  [ast of um soil][horiz of um soil][vert of fear bridge][horiz of lean camp][ast of lean camp][line break]";
	say "  [vert of pale wrath]   [vert of mating hill][line break]";
	say "  [ast of pale wrath][horizbin of sco-forest][ast of roar fest][horizbin of sco-forest][ast of mating hill][line break]";
	say "    [vertbin of sco-bold-carrier][line break]";
	say "[ast of tumorous home][horizbin of sco-lazy-creep][ast of feeling harm] [ast of cold barrier] [ast of screening pool][horizbin of sco-eight-strays][ast of tool cavern][line break]";
	say "[vert of tumorous home] [vertbin of sco-slight-nudge] [vertbin of sco-my-list] [vertbin of sco-dang-fools] [vertbin of whether or not mensch is moot][line break]";
	say "[horiz of trap zoo] [ast of night sludge][horizbin of sco-my-list][ast of ditch park][horizbin of sco-my-list][ast of fang duels] [horiz of tricky pile][line break]";
	say "[vert of watery pond] [vertbin of sco-slight-nudge] [vertbin of sco-my-list] [vertbin of sco-dang-fools] [vert of mass crime][line break]";
	say "[ast of watery pond][horizbin of sco-rocking-blows][ast of blue tombs] [ast of painful garden] [ast of crazy leap][horizbin of sco-lazy-creep][ast of mass crime][line break]";
	say "    [vertbin of sco-gainful-pardon][line break]";
	say "  [ast of violence senders][horizbin of sco-deal-room][ast of real doom][horizbin of sco-deal-room][ast of dutiful bawlers][line break]";
	say "  [vert of violence senders]   [vert of dutiful bawlers][line break]";
	say "  [ast of hater graph][horiz of hater graph][vert of driving rain][horiz of scraped shoals][ast of scraped shoals][line break]";
	say "[variable letter spacing]";
	the rule succeeds;

book scoring

the announce the score rule is not listed in the carry out requesting the score rulebook.

to say it-they of (n - a number): say "[if n is 1]it[else]they[end if]";

carry out requesting the score:
	now verb-dont-print is true;
	say "You have scored a total of [current-score] out of [max-overall] points and need [min-needed] to win. You have found [cur-bonus] of [max-bonus] bonus points so far[if bonus-locked-out > 0]. You are locked out of [bonus-locked-out] point[plur of bonus-locked-out][one of]. You can check for the maximum score dropping in the upper right, which usually happens when you take a one-way passage[or][stopping][end if].";
	now verb-dont-print is false;
	continue the action;

book thinking

the block thinking rule is not listed in any rulebook.

to say here-in of (rm - a room):
	if player is in rm:
		say "here";
	else:
		say "in [rm]"

think-index is a number that varies.

local-header-yet is a truth state that varies

any-think-yet is a truth state that varies.

think-headers is a list of text variable. think-headers is { "Items you can do stuff with:", "Things undone in this region:", "Things undone in all regions:" }

check thinking:
	say "You think of what you've done and what you want to do.";
	now local-header-yet is false;
	now any-think-yet is false;
	now think-index is 1;
	spoon-think-check table of item spoonerisms;
	now local-header-yet is false;
	now think-index is 2;
	spoon-think-check spoontable of mrlp;
	let local-header-yet be false;
	now think-index is 3;
	repeat with rg running through regions:
		if rg is mrlp, next;
		spoon-think-check spoontable of rg;
	if any-think-yet is false:
		say "[line break]There's nothing to do that you tried when you weren't quite ready.";

to spoon-think-check (tn - a table name):
	repeat through tn:
		if idid entry is false and think-cue entry is true:
			if local-header-yet is false:
				say "[line break][entry think-index in think-headers][line break]";
			now local-header-yet is true;
			now any-think-yet is true;
			if there is a think-advice entry:
				say "[think-advice entry]";
			else:
				say "You tried [b][w1 entry in upper case] [w2 entry in upper case][r][if there is a best-room entry] [here-in of best-room entry][end if], but it didn't quite work out. Maybe later.";
	the rule succeeds;

volume parser errors

rule for printing a parser error when the latest parser error is the not a verb I recognise error:
	if core-score is 0:
		say "The lie mist remains, pulsating, menacing. You need to dispel the lie mist. Perhaps it is simpler than you think.";
	else:
		say "You twiddle words around. No, nothing comes up. ([this-game] has a stripped-down parser, so you don't need to do anything fancy with verbs.)";
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

volume meta regions

to moot (x - a thing): move x to nary a void;

definition: a thing (called th) is moot:
	if th is in nary a void, yes;
	no;

gometa is a region.

Nary a Void is a room in gometa. "This is where finished items go.". [once we're done]

Stride Seat is a room in gometa. "This is a bullpen for NPCs that can still chase you around". [temporarily shelved]

volume mapping stuff

index map with woe cell mapped west of um soil.
index map with wayfair cell mapped south of woe cell.

index map with bane row mapped south of watery pond.
index map with near my claim mapped south of bane row.

index map with nary a void mapped east of lean camp.
index map with stride seat mapped south of nary a void.