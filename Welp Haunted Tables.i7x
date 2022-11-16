Version 1/221116 of Welp Haunted Tables by Andrew Schultz begins here.

"This lays out the major tables for Welp Haunted for easy indexing and searching."

table of passthrough 1
word1 (topic)	word2 (topic)	check-rule	run-rule
"howl"	"farm"	a rule	spo-howl-farm rule

this is the spo-howl-farm rule:
	say "You feel a howl farm off to the side, which is creepy, but it's not physically dangerous."
	
the check passthroughs rule is listed first in the for printing a parser error rulebook.

rule for printing a parser error (this is the check passthroughs rule):
	let partial-row be 0;
	repeat through table of passthrough 1:
		if there is a check-rule entry:
			process the check-rule entry;
			unless the rule succeeded, next;
		if the player's command includes word1 entry:
			say "yes.";
		else:
			say "no.";
		if the player's command includes word2 entry:
			say "yes.";
		else:
			say "no.";
		let w1 be whether or not the player's command includes word1 entry;
		let w2 be whether or not the player's command includes word2 entry;
		say "[w1] [w2] [the player's command].";
		let b1 be boolval of w1;
		let b2 be boolval of w2;
		say "[b1] [b2] [b1 + b2].";
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
