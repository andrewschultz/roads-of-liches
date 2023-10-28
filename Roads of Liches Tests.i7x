Version 1/221116 of Roads of Liches Tests by Andrew Schultz begins here.

"This lays out basic IDE tests for Roads of Liches, along with general gauging commands to test game states, such as MISSED to see how a post-game what-the-player-missed would look."

volume silly tests

test all with "test st/test n/test nr/test s/test sr/test w/test w1/test w2/test w3/test w4/test wr/test e1/test e2/test e3/test end". [ does not test doing east first! ]

test wwest1st with "test st/balk wack/test n/test s/test w1/test w2/test w3/test wr/test e1/test e3/test end".

test st with "cleared woes/eh lout/treat chunk/my list/w/start hopping/n/bold carrier/n/forest/s/s/w/slight nudge/e/e/dang fools/w/s/gainful pardon/s/deal room/n/n".

test n with "n/n/w/mill key/rail path/e/e/hating mill/bending pole/n/keen lamp/s/w/w/n/some oil/e/shabby grues/w/s/e/s/s/pitch dark/n/n/e/n/w/beer fridge".

test nr with "e/s/w/s/s".

test w1 with "w/s/two blooms/perky meanie/rocking blows/w/pottery wand/e/n/n/healing farm".

test w2 with "sheddable creep/s/e/e/s/lazy creep/n/w/w/n".

test w3 with "w/humorous tome/speak well/s/zap true".

test wr with "n/e/s/e".

test s with "s/s/e/beautiful dollars/w/w/silence vendors/s/greater half/n/e/e/s/shaped scrolls/w/riving drain/muppet pastor".

test sr with "e/n/w/n/n".

test e1 with "e/n/preening school/s/w/w/n/healing farm/8 strays".

test e2 with "s/e".

test e3 with "e/n/e/cool tavern/tool cavern/muddy wrench/cool tavern/s/picky trial/n/w/s/s/e/crass mime/n/w/n/n/e/s/pricky tile/n/w/s/s/e/n". [this has an extra HEALING FARM command in it]

test er with "w/n/w".

test weast1st with "test st/balk wack/test n/test s/w/n/healing farm/sheddable creep/s/e/e/s/lazy creep/n/n/preening school/s/w/w/n/eight strays/test e2/test w1/test w3/test e3/test end".

test end with "so well/oh swell/thickening suds/revolving door/say farewell/speak mind/rainbow/stop caring/map/clear my name".

volume room description tester

a room can be uncheckable. a room is usually not uncheckable.

[Cold Barrier is uncheckable. Roar Fest is uncheckable. Mating Hill is uncheckable. Lean Camp is uncheckable. Um Soil is uncheckable. Pale Wrath is uncheckable. Fear Bridge is uncheckable.

Real Doom is uncheckable. Painful Garden is uncheckable .Violence Senders is uncheckable. Hater Graph is uncheckable. Dutiful Bawlers is uncheckable. Scraped Shoals is uncheckable. Driving Rain is uncheckable.

Fang Duels is uncheckable. Screening Pool is uncheckable. Tool Cavern is uncheckable. Tricky Pile is uncheckable. Crazy Leap is uncheckable. Mass Crime is uncheckable.

Night Sludge is uncheckable. Feeling Harm is uncheckable. Tumorous Home is uncheckable. Watery Pond is uncheckable. Blue Tombs is uncheckable. Trap Zoo is uncheckable.

Woe Cell is uncheckable. Wayfair Cell is uncheckable. Bane Row is uncheckable. Near My Claim is uncheckable.]

Nary a Void is uncheckable. Stride Seat is uncheckable.

table of final question options (continued)
final question wording	only if victorious	topic	final response rule	final response activity
"(testing only) see [b]ROOM[r] descriptions"	true	"room"	see-room-desc rule	--

threshold is a number that varies. threshold is 40.

this is the see-room-desc rule:
	say "[b]ROOM DESCRIPTIONS[r][line break]";
	let count be 0;
	repeat with rm running through rooms:
		if map region of rm is gometa, next;
		if rm is uncheckable, next;
		increment count;
		if count > threshold, next;
		say "[count]. [rm] ([map region of rm]): ";
		if description of rm is empty:
			say "--------[line break]";
		else:
			say "[description of rm][line break]";
		say "[line break]";
	if count > threshold, say "[count] total rooms to go verify.";

book call from command line

chapter rmding

rmding is an action out of world.

understand the command "rmd" as something new.

understand "rmd" as rmding.

carry out rmding:
	abide by the see-room-desc rule;
	the rule succeeds;

Roads of Liches Tests ends here.

---- DOCUMENTATION ----
