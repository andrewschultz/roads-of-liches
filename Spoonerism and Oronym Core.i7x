Version 1/240717 of Spoonerism and Oronym Core by Andrew Schultz begins here.

"Spoonerism and Oronym command searching utilities."

volume hide at start of game for VERSION/EXT

Use authorial modesty.

volume includes just in case

include Revealing Passages by Andrew Schultz.

include Trivial Niceties by Andrew Schultz.

volume stuff that could almost be in trivial niceties

to decide which region is mrlp: decide on map region of location of player.

volume trivial rule munging

the block thinking rule is not listed in any rulebook.

volume variables

main-table is a table name that varies.

to decide which number is current-score:
	decide on core-score + cur-bonus;

to decide which number is min-needed: decide on core-max + cur-bonus.

to decide which number is max-available: decide on core-max + cur-max-bonus.

to decide which number is max-overall: decide on core-max + max-bonus.

core-score is a number that varies.

last-current-score is a number that varies.

cur-bonus is a number that varies.

last-cur-bonus is a number that varies.

core-score is a number that varies.

a region has a number called curregscore.

volume stuff probably in other series too

the print final score rule is not listed in for printing the player's obituary.

volume maybe could be elsewhere

moot-room is a room that varies.

to moot (x - a thing): move x to moot-room;

definition: a thing (called th) is moot:
	if th is in moot-room, yes;
	no;

[a thing can be examined or unexamined. a thing is usually unexamined.

report examining:
	now the noun is examined;
	continue the action;]

definition: a rule (called ru) is guessed-yet:
	choose row with check-rule of ru in main-table;
	if idid entry is true, no;
	if think-cue entry is true, yes;
	no;

volume saying stuff

to vcal (t - text): [verb conditional print, flag already rhymed e.g. if HEAP HEAT and then try it again]
	now already-word-tweaked is true;
	if verb-dont-print is false, say "[t][line break]";

to vcp (txt - text):
	if verb-dont-print is false, say "[txt]";

to nobreak-if-think: if current action is thinking, skip upcoming rulebook break;

to say once-now of (ru - a rule):
	nobreak-if-think;
	now verb-dont-print is true;
	process ru;
	let rbo be the outcome of the rulebook;
	say "[if rbo is the ready outcome or rbo is the already-done outcome]now[else]once[end if]";
	now verb-dont-print is false;

volume text manipulation

to say first-of-ors of (x - indexed text):
 	replace the regular expression "\|.*" in x with "";
	say "[x in upper case]";

volume scoring stuff

to up-min: increment cur-bonus;

to up-reg:
	increment core-score;
	if mrlp is nothing:
		say "[b]WARNING: NO REGION FOR [location of player]. Please specify one.[r]";
	increment curregscore of mrlp;

volume other basics

to print-the-loc: say "[line break][b][location of player][r][line break]";

definition: a thing (called th) is fungible:
	if th is in location of player, yes;
	no;

verb-dont-print is a truth state that varies.

the wordtwisting rules are a rulebook. the wordtwisting rules have outcomes unavailable, not-yet, already-done, jump-reject, semi-pass and ready.

already-word-tweaked is a truth state that varies.

book going nowhere

check going nowhere (this is the can't go that way by room rule):
	repeat through table of noways:
		if noway-rm entry is location of player:
			say "[noway-txt entry][line break]" instead;

volume rule reorg

the wordguess rules are a table name based rulebook.

partial-row is a number that varies. [this labels the row that is partially/half right, where one word matches]

partial-now is a truth state that varies. [this labels if you have anything partially right that can be done right now]

got-partial-done is a truth state that varies. [rename to partial-already-done for clarity?]

a wordguess rule for a table name (called tn) (this is the main-wordtwisting-checker rule):
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
		if my-count < 2 and there is a posthom entry and the player's command matches the regular expression "(^|\W)([posthom entry])($|\W)":
			if there is a hom-txt-rule entry:
				if debug-state is true, say "(DEBUG [check-rule entry] tripped for homonym, [rb-out]) ";
				process the hom-txt-rule entry;
			else:
				say "Hmm. That [if my-count is 1]really, really[else]kind of partway[end if] SOUNDED like it should work, but it didn't.";
			the rule succeeds;
		if my-count is 1:
			if rb-out is the already-done outcome:
				now got-partial-done is true;
			else:
				now partial-row is row-count;
				if rb-out is the ready outcome:
					now partial-now is true;
			next;
		if my-count is 0, next;
		process the check-rule entry;
		let rb-out be the outcome of the rulebook;
		if rb-out is the already-done outcome, the rule succeeds;
		if rb-out is the not-yet outcome:
			let exact-cmd be true;
			[let exact-cmd be whether or not the player's command matches the text "[first-of-ors of w1 entry][if there is a w2 entry] [first-of-ors of w2 entry][end if]", case insensitively;]
			if check-rule entry is thinknoteblocking:
				say "[paragraph break][i][bracket]NOTE[r][i]: there's nothing you can do about this puzzle at this point, but don't worry, it's not critical to winning the game. It just means you miss out on a slightly better ending.[close bracket]"; [I should expoun more later.]
				now think-cue entry is true;
			if think-cue entry is false and check-rule entry is not thinknoteblocking:
				say "[paragraph break][one of][i][bracket][b]NOTE[r][i]: this command[if exact-cmd is false] (well, an equivalent, as there were alternate solutions)[end if] will be useful later, but you aren't ready to use it, yet. You can track commands like this by typing [b]THINK[r][i], which will also clue you if they now work.[paragraph break]Also, the 'plus' number in the upper right status bar shows the number of not-yet-successful commands you've found.[close bracket][r][line break][or](useful command[if exact-cmd is false] (or a functionally equivalent alternate solution)[end if] again saved to [b]THINK[r] for later reference.)[line break][stopping]";
				now think-cue entry is true;
				if there is an everfail entry:
					now everfail entry is true;
			else:
				say "[paragraph break]Hmph. That [if exact-cmd is false](or a functionally equivalent alternate solution) [end if]still doesn't quite work! You'll figure out the how and when and where, though.";
			the rule succeeds;
		let idid-before be idid entry;
		now idid entry is true;
		if idid-before is false:
			if core entry is true:
				up-reg;
			else:
				up-min;
		process the run-rule entry;
		follow the score and thinking changes rule;
		game-specific-cleanup;
		now think-cue entry is false;
		the rule succeeds;

volume everfail stuff

table of everfails
everfail (truth state)
false

volume useful stubs that can't quite go in Trivial Niceties

to say here-in of (rm - a room): say "[if rm is location of player]here[else if rm is unvisited]somewhere[else]in [rm][end if]"

to say once-now of (ts - a truth state): say "[if ts is true]now[else]once[end if]"

to print-the-loc: say "[b][location of player][r][line break]" [?? move to universal?]

to print-loc-lb: say "[line break][b][location of player][r][line break]" [?? move to universal?]

volume trivia

to say email: say "blurglecruncheon@gmail.com"

to say ghbase: say "http://github.com/andrewschultz"

Spoonerism and Oronym Core ends here.

---- DOCUMENTATION ----
