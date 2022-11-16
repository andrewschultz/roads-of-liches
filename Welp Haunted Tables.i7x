Version 1/221116 of Welp Haunted Tables by Andrew Schultz begins here.

"This lays out the major tables for Welp Haunted for easy indexing and searching."

volume stuff that may go to core

vc-dont-print is a truth state that varies.

volume saying stuff

verb-dont-print is a truth state that varies.

to vcp (txt - text):
	if verb-dont-print is false, say "[txt]";

volume the main tables

table of passthrough 1
word1 (topic)	word2 (topic)	check-rule	run-rule
"start"	"hopping"	pre-start-hopping rule	post-start-hopping rule
"howl"	"farm"	pre-howl-farm rule	post-howl-farm rule
"keep"	"dry"	pre-keep-dry rule	post-keep-dry rule
"creep"	"die"	pre-creep-die rule	post-creep-die rule

this is the pre-start-hopping rule:
	if sco-start-hopping is true, vcp "You're already moving. You don't want to get too agitated." instead;
	the rule succeeds;

this is the post-start-hopping rule:
	say "It's good to feel you can move. You feel less helpless now.";
	now sco-start-hopping is true;

this is the pre-howl-farm rule: the rule succeeds;

this is the post-howl-farm rule:
	say "You feel a howl farm off to the side, which is creepy, but it's not physically dangerous."

this is the pre-keep-dry rule: the rule succeeds;

this is the post-keep-dry rule:
	now sco-keep-dry is true;

this is the pre-creep-die rule: the rule succeeds;

this is the post-creep-die rule:
	now sco-creep-die is true;

volume big picture stuff

the check passthroughs rule is listed first in the for printing a parser error rulebook.

rule for printing a parser error (this is the check passthroughs rule):
	let partial-row be 0;
	repeat through table of passthrough 1:
		if there is a check-rule entry:
			process the check-rule entry;
			unless the rule succeeded, next;
		let w1 be whether or not the player's command includes word1 entry;
		let w2 be whether or not the player's command includes word2 entry;
		let b1 be boolval of w1;
		let b2 be boolval of w2;
		if b1 + b2 is 0, next;
		if b1 + b2 is 2:
			process the run-rule entry;
			increment the score;
			follow the notify score changes rule;
			the rule succeeds;
		now partial-row is 1;
	if partial-row > 0, say "Hmm. You are on the right track, there.";
	continue the action;

Welp Haunted Tables ends here.

---- DOCUMENTATION ----
