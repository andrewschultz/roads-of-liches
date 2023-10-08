Version 1/221116 of Roads of Liches Globals by Andrew Schultz begins here.

"This encompasses variables that would otherwise clutter the story.ni file for Roads of Liches. You can see what can be sent here with def.py."

volume globals

core-max is a number that varies. core-max is 5.

max-bonus is a number that varies. max-bonus is 1.

section copied from PRPR globals

core-score is a number that varies.

cur-bonus is a number that varies.

last-cur-bonus is a number that varies.

last-current-score is a number that varies.

cur-max-bonus is a number that varies. [ what is achievable in the current game state? ]

to decide which number is bonus-locked-out: decide on max-bonus - cur-max-bonus;

when play begins (this is the set current max points to max points rule): now cur-max-bonus is max-bonus;

to decide which number is current-score: decide on core-score + cur-bonus;

to decide which number is min-needed: decide on core-max + cur-bonus.

to decide which number is max-available: decide on core-max + cur-max-bonus.

to decide which number is max-overall: decide on core-max + max-bonus.

to flip-bonus-core (nu - a number):
	increase core-max by nu;
	decrease max-bonus by nu;
	decrease cur-max-bonus by nu;

zap-core-entry is a truth state that varies.

to up-min: increment cur-bonus;

to up-reg: increment core-score;

to up-which (ts - a truth state):
	if ts is true:
		up-reg;
	else:
		up-min;

to max-down: decrement cur-max-bonus;

section general globals

sco-cleared-woes is a truth state that varies.

sco-speak-well is a truth state that varies.

sco-greater-half is a truth state that varies.

section ditch park globals

sco-treat-chunk is a truth state that varies.

sco-my-list is a truth state that varies.

sco-start-hopping is a truth state that varies.

section north path globals

sco-howl-farm is a truth state that varies.

sco-forest is a truth state that varies.

sco-dang-fools is a truth state that varies.

sco-keep-dry is a truth state that varies.
sco-creep-die is a truth state that varies.

sco-say-farewell is a truth state that varies.

section south path globals

sco-gainful-pardon is a truth state that varies.

section east path globals

sco-cool-grow is a truth state that varies.
sco-cruel-go is a truth state that varies.
sco-ghoul-crow is a truth state that varies.

section west path globals

sco-slight-nudge is a truth state that varies.

sco-speak-mind is a truth state that varies.

book game states

used-cheats is a truth state that varies.

Roads of Liches Globals ends here.

---- DOCUMENTATION ----
