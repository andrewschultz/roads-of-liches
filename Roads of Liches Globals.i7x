Version 1/221116 of Roads of Liches Globals by Andrew Schultz begins here.

"This encompasses variables that would otherwise clutter the story.ni file for Roads of Liches. You can see what can be sent here with def.py."

volume globals

core-max is a number that varies. core-max is 46.

max-bonus is a number that varies. max-bonus is 4.

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

to up-reg:
	increment core-score;
	increment curregscore of mrlp;

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

sco-pitch-dark is a truth state that varies.

section north path globals

sco-speak-mind is a truth state that varies.

sco-forest is a truth state that varies.

sco-mill-key is a truth state that varies.
sco-rail-path is a truth state that varies.

sco-some-oil is a truth state that varies.

sco-hating-mill is a truth state that varies.
sco-bending-pole is a truth state that varies.

sco-keen-lamp is a truth state that varies.

sco-shabby-grues is a truth state that varies.

sco-beer-fridge is a truth state that varies.

section south path globals

sco-gainful-pardon is a truth state that varies.

sco-deal-room is a truth state that varies.

sco-silence-vendors is a truth state that varies.

section east path globals

sco-dang-fools is a truth state that varies.

sco-cool-grow is a truth state that varies.
sco-cruel-go is a truth state that varies.
sco-ghoul-crow is a truth state that varies.

section west path globals

sco-slight-nudge is a truth state that varies.

sco-rocking-blows is a truth state that varies.
sco-perky-meanie is a truth state that varies.

sco-humorous-tome is a truth state that varies.

section endgame globals

sco-say-farewell is a truth state that varies.

section unsorted globals

sco-keep-dry is a truth state that varies.
sco-creep-die is a truth state that varies.

sco-pottery-wand is a truth state that varies.

sco-zap-true is a truth state that varies.

sco-healing-farm is a truth state that varies.

sco-sheddable-creep is a truth state that varies.

sco-lazy-creep is a truth state that varies.

sco-cool-tavern is a truth state that varies.

sco-beautiful-dollars is a truth state that varies.

sco-scraped-shoals is a truth state that varies.

sco-shaped-scrolls is a truth state that varies.

sco-muppet-pastor is a truth state that varies.

sco-crass-mime is a truth state that varies.

sco-preening-school is a truth state that varies.

sco-eight-strays is a truth state that varies.

sco-muddy-wrench is a truth state that varies.

sco-pricky-tile is a truth state that varies.
sco-picky-trial is a truth state that varies.

sco-revolving-door is a truth state that varies.

sco-oh-swell is a truth state that varies.
sco-so-well is a truth state that varies.

sco-rain-bow is a truth state that varies.

sco-clear-name is a truth state that varies.

sco-thickening-suds is a truth state that varies.

sco-riving-drain is a truth state that varies.

sco-stop-caring is a truth state that varies.

sco-two-blooms is a truth state that varies.

sco-bold-carrier is a truth state that varies.

sco-eh-lout is a truth state that varies.

book game states

pile-status is a number that varies.
mime-tile is a truth state that varies.
mime-trial is a truth state that varies.

cavern-is-tavern is a truth state that varies.

used-cheats is a truth state that varies.

Roads of Liches Globals ends here.

---- DOCUMENTATION ----
