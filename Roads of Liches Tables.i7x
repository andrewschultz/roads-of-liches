Version 1/221116 of Roads of Liches Tables by Andrew Schultz begins here.

"This lays out the major tables for Roads of Liches for easy indexing and searching."

[mrc.py can add code easily even though it was originally for VVFF. Use ?? to see examples in case they are forgotten. MRC detects whether we are in a double-rhyme or spoonerism directory.]

volume stuff that may go to core

definition: a thing (called th) is fungible:
	if th is in location of player, yes;
	no;

verb-dont-print is a truth state that varies.

the spoonerism rules are a rulebook. the spoonerism rules have outcomes unavailable, not-yet, already-done, jump-reject, semi-pass and ready.

already-spoonerized is a truth state that varies.

volume saying stuff

to vcal (t - text): [verb conditional print, flag already rhymed e.g. if HEAP HEAT and then try it again]
	now already-spoonerized is true;
	if verb-dont-print is false, say "[t][line break]";

to vcp (txt - text):
	if verb-dont-print is false, say "[txt]";

volume the main tables

book very general stuff

table of item spoonerisms
w1 (text)	w2 (text)	posthom (topic)	hom-txt-rule (rule)	think-cue	okflip	core	idid	best-room	check-rule	run-rule	wfull (topic)	think-advice (text)
"cleared"	"woes"	--	--	false	true	false	false	--	pre-cleared-woes rule	post-cleared-woes rule
"speak"	"well"	--	--	false	true	true	false	--	pre-speak-well rule	post-speak-well rule	--	--
"greater"	"half"	--	--	false	true	true	false	--	pre-greater-half rule	post-greater-half rule	--	--

book hub stuff

table of hub spoonerisms
w1 (text)	w2 (text)	posthom (topic)	hom-txt-rule (rule)	think-cue	okflip	core	idid	best-room	check-rule	run-rule	wfull (topic)	think-advice (text)
"my"	"list"	--	--	false	true	true	false	Ditch Park	pre-my-list rule	post-my-list rule	--	--
"start"	"hopping"	--	--	false	true	true	false	Ditch Park	pre-start-hopping rule	post-start-hopping rule
"treat"	"chunk"	--	--	false	true	true	false	ditch park	pre-treat-chunk rule	post-treat-chunk rule	--	--

section ditch park scoring

a spoonerism rule (this is the pre-treat-chunk rule):
	if player is not in ditch park, unavailable;
	if player carries treat chunk:
		vcal "You already have a treat chunk! You will need to drop or use it to get another.";
		already-done;
	ready;

this is the post-treat-chunk rule:
	say "A treat chunk flies from the cheat trunk. Mmm, it looks like trail mix.";
	now player has treat chunk;
	now sco-treat-chunk is true;

a spoonerism rule (this is the pre-cleared-woes rule):
	if sco-cleared-woes is true:
		vcal "You already cleared woes. If you try too hard, you may wind up trying too hard to convince yourself you did, and they'll come back.";
		already-done;
	ready;

this is the post-cleared-woes rule:
	now sco-cleared-woes is true;
	say "You feel a little less weird now. This may have no concrete value, but it's nice all the same.";

a spoonerism rule (this is the pre-my-list rule):
	if player is not in Ditch Park, unavailable;
	if sco-my-list is true:
		vcal "You already dispelled the lie mist!";
		already-done;
	ready;

this is the post-my-list rule:
	now sco-my-list is true;
	say "The lie mist dissipates, but not before you hear whisperings that any old fool could've figured that out. Really![paragraph break]But you are so glad to see a paper labeled 'my list' that you don't, in fact, care.[paragraph break]Also, there's some sort of trunk here. A cheat trunk! What could be in it?";
	now player has my list;
	move cheat trunk to Ditch Park;

a spoonerism rule (this is the pre-start-hopping rule):
	if sco-start-hopping is true:
		vcal "You're already moving. You don't want to get too agitated.";
		already-done;
	ready;

this is the post-start-hopping rule:
	say "It's good to feel you can move. You feel less helpless now.";
	now sco-start-hopping is true;

a spoonerism rule (this is the pre-speak-well rule):
	if weak spell is not touchable, unavailable;
	if sco-speak-well is true:
		vcal "You already acquired the weak spell!";
		already-done;
	ready;

this is the post-speak-well rule:
	now sco-speak-well is true;
	say "Hooray! You figured what to do! You get a point!";
	now player has weak spell;

a spoonerism rule (this is the pre-greater-half rule):
	if hater graph is not touchable, unavailable;
	if sco-greater-half is true:
		vcal "You already took the hater graph!";
		already-done;
	ready;

this is the post-greater-half rule:
	now sco-greater-half is true;
	say "You see benefits to having such a graph. So you are able to take it.";
	now player has hater graph;

book north spoke

table of north spoke spoonerisms
w1 (text)	w2 (text)	posthom (topic)	hom-txt-rule (rule)	think-cue	okflip	core	idid	best-room	check-rule	run-rule	wfull (topic)	think-advice (text)
"speak"	"mind"	--	--	false	true	true	false	meek spined	pre-speak-mind rule	post-speak-mind rule	--	--
"four|for"	"rest"	--	--	false	true	false	false	roar fest	pre-forest rule	post-forest rule	"forest"	--
"howl"	"farm"	--	--	false	true	true	false	Ditch Park	pre-howl-farm rule	post-howl-farm rule
"dang"	"fools"	--	--	false	true	true	false	Fang Duels	pre-dang-fools rule	post-dang-fools rule	--	--
"keep"	"dry"	--	--	false	true	true	false	Howl Farm	pre-keep-dry rule	post-keep-dry rule
"creep"	"die"	--	--	false	true	true	false	Howl Farm	pre-creep-die rule	post-creep-die rule
"say"	"farewell"	--	--	false	true	true	false	wayfair cell	pre-say-farewell rule	post-say-farewell rule	--	--

a spoonerism rule (this is the pre-speak-mind rule):
	if player is not in meek spined, unavailable;
	if sco-speak-mind is true:
		vcal "You already spoke your mind!";
		already-done;
	ready;

this is the post-speak-mind rule:
	now sco-speak-mind is true;
	say "Speaking your mind makes you feel a bit better.";

section roar fest scoring

a spoonerism rule (this is the pre-forest rule):
	if player is not in roar fest, unavailable;
	if sco-forest is true:
		vcal "You already created a forest path!";
		already-done;
	ready;

this is the post-forest rule:
	now sco-forest is true;
	say "The roar fest quiets a bit. It opens up a passage to a dark forest, which is slightly less intimidating.";

this is the pre-howl-farm rule:
	if sco-howl-farm is true:
		vcal "You already opened passage to the howl farm.";
		already-done;
	ready;

this is the post-howl-farm rule:
	say "You feel a howl farm off to the side, which is creepy, but it's not physically dangerous.";
	now howl farm is mapped west of ditch park;
	now ditch park is mapped east of howl farm;
	now sco-howl-farm is true;

a spoonerism rule (this is the pre-dang-fools rule):
	if player is not in fang duels, unavailable;
	if sco-dang-fools is true:
		vcal "You already expressed your contempt. Repeated expression of contempt may make you act like a dang fool at the wrong time in the near future.";
		already-done;
	ready;

this is the post-dang-fools rule:
	now sco-dang-fools is true;
	say "You realize aggression just wears people out. You express this brilliant philosophical belief eloquently. Either the entities involved are too intimidated by your intelligence, or they find you too wussy to bother with. But they are gone, and that's what matters![paragraph break]You're a bit bummed you are in a text adventure and not a TV show, so you can't give kids one to grow on, but hey.";

a spoonerism rule (this is the pre-keep-dry rule):
	if deep cry is not fungible, unavailable;
	if sco-keep-dry is true:
		vcal "You already kept dry.";
		already-done;
	ready;

this is the post-keep-dry rule:
	say "You keep dry.";
	now sco-keep-dry is true;

a spoonerism rule (this is the pre-creep-die rule):
	if deep cry is not fungible, unavailable;
	if sco-keep-dry is false:
		vcal "You don't feel the confidence to say that. You need a middle or medium step before that.";
		already-done;
	ready;

this is the post-creep-die rule:
	now sco-creep-die is true;

a spoonerism rule (this is the pre-say-farewell rule):
	if player is not in wayfair cell, unavailable;
	ready;

this is the post-say-farewell rule:
	now sco-say-farewell is true;
	say "And just like that, you realize you shouldn't be bound by your own chains! It's time to move on. And you do.";
	move player to Ditch Park;

book south spoke

table of south spoke spoonerisms
w1 (text)	w2 (text)	posthom (topic)	hom-txt-rule (rule)	think-cue	okflip	core	idid	best-room	check-rule	run-rule	wfull (topic)	think-advice (text)
"gainful"	"pardon"	--	--	false	true	true	false	Painful Garden	pre-gainful-pardon rule	post-gainful-pardon rule	--	--

a spoonerism rule (this is the pre-gainful-pardon rule):
	if player is not in Painful Garden, unavailable;
	if sco-gainful-pardon is true:
		vcal "You already found some semblance of peace here.";
		already-done;
	ready;

this is the post-gainful-pardon rule:
	now sco-gainful-pardon is true;
	say "Well, you can't expect any judge to give you a sealed document, so you work things out for yourself. Perhaps there are some things you need to make restitution for, but pain for its own sake will do no good, and you'll think of anything once you get out. If you get out. Maybe track down someone you did wrong. Here, though, not much to do.";

book east spoke

table of east spoke spoonerisms
w1 (text)	w2 (text)	posthom (topic)	hom-txt-rule (rule)	think-cue	okflip	core	idid	best-room	check-rule	run-rule	wfull (topic)	think-advice (text)
"ghoul"	"crow"	--	--	false	true	true	false	gruel co	pre-ghoul-crow rule	post-ghoul-crow rule	--	--
"cruel"	"go"	--	--	false	true	true	false	gruel co	pre-cruel-go rule	post-cruel-go rule	--	--
"cool"	"grow"	--	--	false	true	true	false	gruel co	pre-cool-grow rule	post-cool-grow rule	--	--

a spoonerism rule (this is the pre-ghoul-crow rule):
	if player is not in gruel co, unavailable;
	if sco-ghoul-crow is true:
		vcal "But you already summoned the ghoul crow!";
		already-done;
	ready;

this is the post-ghoul-crow rule:
	now sco-ghoul-crow is true;
	say "A large ghoul crow appears! Boy, it looks evil. And yet ... and yet, perhaps it has a weakness. Perhaps you can work through its hard shell.";
	move ghoul crow to Gruel Co;

a spoonerism rule (this is the pre-cruel-go rule):
	if player is not in gruel co, unavailable;
	if sco-ghoul-crow is false:
		vcp "You don't have anyone to yell that at yet!";
		not-yet;
	if sco-cruel-go is true:
		vcal "But you already told the ghoul crow off!";
		already-done;
	ready;

this is the post-cruel-go rule:
	now sco-cruel-go is true;
	say "The ghoul crow flashes a momentary look of regret and guilt, then goes off to goodness knows where.";

a spoonerism rule (this is the pre-cool-grow rule):
	if player is not in gruel co, unavailable;
	if sco-cruel-go is false:
		vcp "You [if ghoul crow is off-stage]sense you [end if]have not rid Gruel Co of the evil presence that is keeping it down.";
		not-yet;
	if sco-cool-grow is true:
		vcal "You already rebuilt Gruel Co!";
		already-done;
	ready;

this is the post-cool-grow rule:
	now sco-cool-grow is true;
	say "Gruel Co un-crumbles. You are about to leave, just grateful to help with the job well done, but then ... you are offered some paying gruel as reward!";
	now player has paying gruel;

book west spoke

table of west spoke spoonerisms
w1 (text)	w2 (text)	posthom (topic)	hom-txt-rule (rule)	think-cue	okflip	core	idid	best-room	check-rule	run-rule	wfull (topic)	think-advice (text)
"slight"	"nudge"	--	--	false	true	true	false	night sludge	pre-slight-nudge rule	post-slight-nudge rule	--	--

a spoonerism rule (this is the pre-slight-nudge rule):
	if player is not in night sludge, unavailable;
	if sco-slight-nudge is true:
		vcal "You already found a way through. It shouldn't be too bad to move on, now.";
		already-done;
	ready;

this is the post-slight-nudge rule:
	now sco-slight-nudge is true;
	say "You look around, hoping for a clue, and you find it. You scrap your foot along the path, and some parts are less icky than others.";

volume big picture stuff

the check forks rule is listed first in the for printing a parser error rulebook.

rule for printing a parser error (this is the check forks rule):
	abide by the main-spoonerism-checker rule for table of item spoonerisms;
	if debug-state is true, say "DEBUG INFO [mrlp]: [spoontable of mrlp], [firstdir of mrlp].";
	if firstdir of mrlp is not down:
		abide by the main-spoonerism-checker rule for spoontable of mrlp;
	continue the action;

volume rule reorg

the wordguess rules are a table name based rulebook.

a wordguess rule for a table name (called tn) (this is the main-spoonerism-checker rule):
	let partial-row be 0;
	let row-count be 0;
	repeat through tn:
		increment row-count;
		now verb-dont-print is true;
		process the check-rule entry;
		let rb-out be outcome of the rulebook;
		now verb-dont-print is false;
		if rb-out is unavailable outcome, next;
		let my-count be 0;
		if there is a wfull entry and the player's command matches the wfull entry:
			now my-count is 4; [ 4 = topic match, 3 = mix up alt solutions, 2 = 2 word match (or DIMD). This is a magic number to get rid of a boolean, so we can have all non global variables inside one rule, because Inform only allows 15 local variables. ]
		else:
			if the player's command matches the regular expression "(^|\W)([w1 entry])($|\W)", increment my-count;
			if there is a w2 entry:
				if the player's command matches the regular expression "(^|\W)([w2 entry])($|\W)", increment my-count;
			else if my-count > 0:
				increment my-count;
		if my-count is 2 and there is a wfull entry:
			say "You are close, but you probably need to add a trivial word.";
			the rule succeeds;
		if my-count is 1:
			now partial-row is row-count;
			next;
		if my-count is 0, next;
		process the check-rule entry;
		let rb-out be the outcome of the rulebook;
		if rb-out is the already-done outcome, the rule succeeds;
		if rb-out is the not-yet outcome:
			let exact-cmd be true;
			[let exact-cmd be whether or not the player's command matches the text "[first-of-ors of w1 entry][if there is a w2 entry] [first-of-ors of w2 entry][end if]", case insensitively;]
			if think-cue entry is false:
				say "[line break][one of][b]NOTE[r]: this command[if exact-cmd is false] (well, an equivalent, as there were alternate solutions)[end if] will be useful later, but you aren't ready to use it, yet. You can track commands like this by typing [b]THINK[r], which will also clue you if they now work.[or](useful command[if exact-cmd is false] (or a functionally equivalent alternate solution)[end if] again saved to [b]THINK[r] for later reference.)[stopping]";
				now think-cue entry is true;
			else:
				say "[line break]Hmph. That [if exact-cmd is false](or a functionally equivalent alternate solution) [end if]still doesn't quite work! You'll figure out the how and when and where, though.";
			the rule succeeds;
		now idid entry is true;
		process the run-rule entry;
		increment the score;
		follow the notify score changes rule;
		the rule succeeds;
	if partial-row > 0:
		say "Hmm. You are on the right track, there.";
		the rule succeeds;

Roads of Liches Tables ends here.

---- DOCUMENTATION ----
