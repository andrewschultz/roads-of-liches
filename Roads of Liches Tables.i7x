Version 1/221116 of Roads of Liches Tables by Andrew Schultz begins here.

"This lays out the major tables for Roads of Liches for easy indexing and searching."

[mrc.py can add code easily even though it was originally for VVFF. Use ?? to see examples in case they are forgotten. MRC detects whether we are in a double-rhyme or spoonerism directory.]

volume stuff that may go to core

to bothways:
	now location of player is not oneway;

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
"eh"	"lout"	--	--	false	true	false	false	--	pre-eh-lout rule	post-eh-lout rule	--	--
"speak"	"well"	--	--	false	true	true	false	--	pre-speak-well rule	post-speak-well rule	--	--
"eight|8"	"strays"	--	--	false	true	true	false	Feeling Harm	pre-eight-strays rule	post-eight-strays rule	--	--

a spoonerism rule (this is the pre-cleared-woes rule):
	if sco-cleared-woes is true:
		vcal "You already cleared woes. If you try too hard, you may wind up trying too hard to convince yourself you did, and they'll come back.";
		already-done;
	ready;

this is the post-cleared-woes rule:
	now sco-cleared-woes is true;
	say "You feel a little less weird now. This may have no concrete value, but it's nice all the same.";

a spoonerism rule (this is the pre-eh-lout rule):
	if sco-eh-lout is true:
		vcal "You already expressed pointless exasperation when I tried to help you! I'll only let you get away with that once.";
		already-done;
	ready;

this is the post-eh-lout rule:
	now sco-eh-lout is true;
	say "You relieve your stress, expressing exasperation when I was just trying to help you.";

a spoonerism rule (this is the pre-speak-well rule):
	if weak spell is not touchable, unavailable;
	if sco-speak-well is true:
		vcal "You already mastered the weak spell!";
		already-done;
	ready;

this is the post-speak-well rule:
	now sco-speak-well is true;
	say "You practice the weak spell, and you get it nailed down nicely.";

a spoonerism rule (this is the pre-eight-strays rule):
	if player does not have straight as, unavailable;
	if player is not in feeling harm:
		vcp "You can't just let eight strays wander out anywhere!";
		not-yet;
	if sco-healing-farm is false:
		vcp "It'd be cruel to leave the eight strays here as-is. Could you change the environs?";
		not-yet;
	ready;

this is the post-eight-strays rule:
	now sco-eight-strays is true;
	say "The straight A's change into eight strays, who are happy in the healing farm. You pet them all a bit. You hope you did this for them and not just to gain passage east of Preening School!";
	move strays to feeling harm;
	moot straight as;

book hub stuff

table of hub spoonerisms
w1 (text)	w2 (text)	posthom (topic)	hom-txt-rule (rule)	think-cue	okflip	core	idid	best-room	check-rule	run-rule	wfull (topic)	think-advice (text)
"my"	"list"	--	--	false	true	true	false	Ditch Park	pre-my-list rule	post-my-list rule	--	--
"start"	"hopping"	--	--	false	true	true	false	Ditch Park	pre-start-hopping rule	post-start-hopping rule
"treat"	"chunk"	--	--	false	true	false	false	ditch park	pre-treat-chunk rule	post-treat-chunk rule	--	--
"pitch"	"dark"	--	--	false	true	true	false	ditch park	pre-pitch-dark rule	post-pitch-dark rule	--	--

a spoonerism rule (this is the pre-pitch-dark rule):
	if player is not in ditch park, unavailable;
	if shabby grues are not in ditch park:
		vcp "You have no need to make everything pitch dark at the moment!";
		not-yet;
	if sco-pitch-dark is true:
		vcal "You already made Ditch Park pitch dark.";
		already-done;
	ready;

this is the post-pitch-dark rule:
	now sco-pitch-dark is true;
	say "You make Ditch Park pitch dark for a moment. You hear the grues getting closer, then you turn the lamp as bright as it will go. There is much screaming, fleeing, and falling into ditches! The grues that did not, all run away.[paragraph break]But this creates a problem! What if the grues come back? You have an idea! You stick the bending pole between two trees, and you notice there's a hook on the lamp. So you hang it from the pole, and voila, a light source! And a clearer inventory, too!";
	moot shabby grues;
	move bending pole to ditch park;
	move lamp to ditch park;

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
	set the pronoun it to treat chunk;
	now sco-treat-chunk is true;

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
	if player is not in ditch park and need-to-hop is false, unavailable;
	if sco-start-hopping is true:
		vcal "You're already moving. You don't want to get too agitated.";
		already-done;
	ready;

this is the post-start-hopping rule:
	say "It's good to feel you can move. You feel less helpless now.";
	now sco-start-hopping is true;
	now need-to-hop is false;

book north spoke

table of north spoke spoonerisms
w1 (text)	w2 (text)	posthom (topic)	hom-txt-rule (rule)	think-cue	okflip	core	idid	best-room	check-rule	run-rule	wfull (topic)	think-advice (text)
"bold"	"carrier"	--	--	false	true	true	false	cold barrier	pre-bold-carrier rule	post-bold-carrier rule	--	--
"four|for"	"rest"	--	--	false	true	true	false	roar fest	pre-forest rule	post-forest rule	"forest"	--
"rail"	"path"	--	--	false	true	true	false	pale wrath	pre-rail-path rule	post-rail-path rule	--	--
"mill"	"key"	--	--	false	true	true	false	pale wrath	pre-mill-key rule	post-mill-key rule	--	--
"bending"	"pole"	--	--	false	true	true	false	Mating Hill	pre-bending-pole rule	post-bending-pole rule	--	--
"hating"	"mill"	--	--	false	true	true	false	mating hill	pre-hating-mill rule	post-hating-mill rule	--	--
"keen"	"lamp"	--	--	false	true	true	false	lean camp	pre-keen-lamp rule	post-keen-lamp rule	--	--
"some"	"oil"	--	--	false	true	true	false	um soil	pre-some-oil rule	post-some-oil rule	--	--
"shabby"	"grues"	--	--	false	true	true	false	fear bridge	pre-shabby-grues rule	post-shabby-grues rule	--	--
"beer"	"fridge"	--	--	false	true	true	false	fear bridge	pre-beer-fridge rule	post-beer-fridge rule	--	--

section cold barrier scoring

a spoonerism rule (this is the pre-bold-carrier rule):
	if player is not in cold barrier, unavailable;
	if sco-bold-carrier is true:
		vcal "You already feel safer here!";
		already-done;
	ready;

this is the post-bold-carrier rule:
	now sco-bold-carrier is true;
	say "The ground warms up and turns grey. Well, some of it. You're on an aircraft carrier, but thankfully without the water around, now. The carrier caused a split in the barrier to the north, so you can go that way, now.";


section hating mill scoring

a spoonerism rule (this is the pre-hating-mill rule):
	if player is not in mating hill, unavailable;
	if sco-hating-mill is true:
		vcal "You already opened the hating mill!";
		already-done;
	ready;

this is the post-hating-mill rule:
	now sco-hating-mill is true;
	say "The mating hill flattens out, revealing passage north.";
	follow the try-opening-mill rule;

a spoonerism rule (this is the pre-bending-pole rule):
	if pending bowl is not fungible, unavailable;
	ready;

this is the post-bending-pole rule:
	now sco-bending-pole is true;
	say "Pop! The pending bowl becomes a bending pole.";
	moot pending bowl;
	now player has bending pole;

section pale wrath scoring

a spoonerism rule (this is the pre-mill-key rule):
	if player is not in pale wrath, unavailable;
	if sco-mill-key is true:
		vcal "You already got the mill key!";
		already-done;
	ready;

this is the post-mill-key rule:
	now sco-mill-key is true;
	say "A mill key appears in your hand.";
	now player has mill key;

a spoonerism rule (this is the pre-rail-path rule):
	if player is not in pale wrath, unavailable;
	if sco-rail-path is true:
		vcal "You already made the rail path!";
		already-done;
	ready;

this is the post-rail-path rule:
	now sco-rail-path is true;
	say "The wrath subsides, revealing a rickety rail path to the north. You'll probably need assistance to make it across without falling. It's a huge drop down!";

section um soil scoring

a spoonerism rule (this is the pre-some-oil rule):
	if player is not in um soil and player does not have oil, unavailable;
	if sco-some-oil is true:
		vcal "You already got some oil! Save some for the next unfortunate adventurer.";
		already-done;
	ready;

this is the post-some-oil rule:
	now sco-some-oil is true;
	say "You have some oil! It's in a nice can, too!";
	now player has oil;
	process-oil-lamp;

to process-oil-lamp:
	if lamp-score is 2:
		say "[line break]It's pretty clear the oil can be poured in the lamp. So you do that.";
		moot oil;

section lean camp scoring

a spoonerism rule (this is the pre-keen-lamp rule):
	if player is not in lean camp, unavailable;
	if sco-keen-lamp is true:
		vcal "You already looted the camp!";
		already-done;
	ready;

this is the post-keen-lamp rule:
	now sco-keen-lamp is true;
	say "You search the camp with an idea of what to find. And a lamp turns up! A surprisingly nice one! You feel great, until you wonder if this is proof manifesting actually works for far worse people than yourself as well.";
	now player has keen lamp;
	process-oil-lamp;

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

section fear bridge scoring

a spoonerism rule (this is the pre-shabby-grues rule):
	if player is not in fear bridge, unavailable;
	if lamp-score < 2:
		vcp "No way. Not without a reliable light source.";
		not-yet;
	ready;

this is the post-shabby-grues rule:
	now sco-shabby-grues is true;
	say "The grabby shoes pop out, replaced by shabby grues. You'll need to get past them, somehow.";
	moot grabby shoes;
	move shabby grues to fear bridge;

a spoonerism rule (this is the pre-beer-fridge rule):
	if player is not in fear bridge, unavailable;
	if shabby grues are not moot:
		vcp "You fear there may be some deep dark evil behind everything.";
		not-yet;
	if sco-beer-fridge is true:
		vcal "You already created the beer fridge!";
		already-done;
	ready;

this is the post-beer-fridge rule:
	now sco-beer-fridge is true;
	say "The fear bridge collapses to form a beer fridge. Your work in this sector is done.";
	solverg;

to solverg:
	now mrlp is solved;
	bothways;
	say "You find a[one of][or]nother[stopping] mauled scrap.";
	if nsr is 4:
		say "And this time, they all fit together to find a way down the roads of liches! But you are captured...";
		follow the score and thinking changes rule;
		say "Oh no! You're dumped in ...";
		move player to woe cell;
		moot my list;
		if sco-treat-chunk is false:
			max-down;
			max-down;
	else:
		say "But the scrawled map is incomplete. Still, yay progress.";

book south spoke

table of south spoke spoonerisms
w1 (text)	w2 (text)	posthom (topic)	hom-txt-rule (rule)	think-cue	okflip	core	idid	best-room	check-rule	run-rule	wfull (topic)	think-advice (text)
"gainful"	"pardon"	--	--	false	true	true	false	Painful Garden	pre-gainful-pardon rule	post-gainful-pardon rule	--	--
"beautiful"	"dollars"	--	--	false	true	true	false	dutiful bawlers	pre-beautiful-dollars rule	post-beautiful-dollars rule	--	--
"deal"	"room"	--	--	false	true	true	false	real doom	pre-deal-room rule	post-deal-room rule	--	--
"silence"	"vendors"	--	--	false	true	true	false	violence senders	pre-silence-vendors rule	post-silence-vendors rule	--	--
"greater"	"half"	--	--	false	true	true	false	hater graph	pre-greater-half rule	post-greater-half rule	--	--
"shaped"	"scrolls"	--	--	false	true	true	false	scraped shoals	pre-shaped-scrolls rule	post-shaped-scrolls rule	--	--
"riving"	"drain"	--	--	false	true	true	false	driving rain	pre-riving-drain rule	post-riving-drain rule	--	--
"muppet"	"pastor"	--	--	false	true	true	false	driving rain	pre-muppet-pastor rule	post-muppet-pastor rule	--	--

section painful garden scoring

a spoonerism rule (this is the pre-gainful-pardon rule):
	if player is not in Painful Garden, unavailable;
	if sco-gainful-pardon is true:
		vcal "You already found some semblance of peace here.";
		already-done;
	ready;

this is the post-gainful-pardon rule:
	now sco-gainful-pardon is true;
	say "Well, you can't expect any judge to give you a sealed document, so you work things out for yourself. Perhaps there are some things you need to make restitution for, but pain for its own sake will do no good, and you'll think of anything once you get out. If you get out. Maybe track down someone you did wrong. Here, though, not much to do.";

section real doom scoring

a spoonerism rule (this is the pre-deal-room rule):
	if player is not in real doom, unavailable;
	if sco-deal-room is true:
		vcal "You already dealt with the real doom!";
		already-done;
	ready;

this is the post-deal-room rule:
	now sco-deal-room is true;
	say "You feel slightly less awful about things as the sense of real doom pulls back. Of course, bad things can happen in a deal room and do.";

section dutiful bawlers scoring

a spoonerism rule (this is the pre-beautiful-dollars rule):
	if player is not in dutiful bawlers, unavailable;
	if sco-beautiful-dollars is true:
		vcal "Don't get greedy!";
		already-done;
	ready;

this is the post-beautiful-dollars rule:
	now sco-beautiful-dollars is true;
	say "Oh, man! You give minimal consolation, and the bawlers hand the dollars over to you ... not that money buys happiness these days, anyway!";
	now player has dollars;

section violence senders scoring

a spoonerism rule (this is the pre-silence-vendors rule):
	if player is not in violence senders, unavailable;
	if sco-silence-vendors is true:
		vcal "You already summoned the silence vendors!";
		already-done;
	ready;

this is the post-silence-vendors rule:
	now sco-silence-vendors is true;
	say "Silence vendors appear and hold up a paper saying 'We don't sell silence for free!'";
	move silence vendors to violence senders;
	follow the dollars-and-vendors rule;

section hater graph scoring

a spoonerism rule (this is the pre-greater-half rule):
	if player is not in hater graph, unavailable;
	if sco-greater-half is true:
		vcal "You already took the hater graph!";
		already-done;
	ready;

this is the post-greater-half rule:
	now sco-greater-half is true;
	say "You stare at the hater graph a bit. Yes, it is biased. It overemphasizes certain data. You extract a more favorable interpretation of what is going on. You reach behind the graph and get ... a greater half.";
	now player has greater half;

section scraped shoals scoring

a spoonerism rule (this is the pre-shaped-scrolls rule):
	if player is not in scraped shoals, unavailable;
	if sco-shaped-scrolls is true:
		vcal "There can't be more to find in the scraped shoals.";
		already-done;
	if sco-greater-half is false:
		vcal "But you aren't sure what you are looking for. Maybe if you had part of a document...";
		already-done;
	ready;

this is the post-shaped-scrolls rule:
	now sco-shaped-scrolls is true;
	say "You look around the scraped shoals. A lot of scrolls are hidden, but only one fits together with the greater half. Once it does, you read it -- and wow! That's profound.";
	moot greater half;
	now player has shaped scrolls;

section driving rain scoring

a spoonerism rule (this is the pre-riving-drain rule):
	if player is not in driving rain, unavailable;
	if sco-riving-drain is true:
		vcal "The riving drain cannot rive further.";
		already-done;
	ready;

this is the post-riving-drain rule:
	now sco-riving-drain is true;
	say "The driving rain lets up a bit, revealing a riving drain that may or may not always have been there.[paragraph break]Either way, it's nice to have a break in the weather! What isn't so nice is the puppet master that rises from the drain.";

a spoonerism rule (this is the pre-muppet-pastor rule):
	if player is not in driving rain and puppet master is not touchable, unavailable;
	if player does not have scrolls:
		vcp "The puppet master smacks down your feeble spoonerism/portmanteau combo try. Obviously, it's not within the rules! Why, it can't be![paragraph break]And yet, perhaps, with the right documentation, you could flim-flam your way past this semantic barrier.";
		not-yet;
	ready;

this is the post-muppet-pastor rule:
	now sco-muppet-pastor is true;
	say "The puppet master wags their finger at your portmanteau-rhyme, but you've come prepared with evidence why this is okay, despite seeming problems. There's a big argument, but thankfully, you studied the scrolls, and eventually the puppet master lashes out. In a final futile gesture, the puppet master grabs at your scrolls, rips them in half and ... out falls a mauled scrap![paragraph break]The argument continues, but since you read the scrolls so dutifully, you fight back effectively. The puppet master slinks away, defeated by your impressive arguments. Or maybe tired of the whole ordeal.";
	moot puppet master;
	moot shaped scrolls;
	solverg;

book east spoke

table of east spoke spoonerisms
w1 (text)	w2 (text)	posthom (topic)	hom-txt-rule (rule)	think-cue	okflip	core	idid	best-room	check-rule	run-rule	wfull (topic)	think-advice (text)
"dang"	"fools"	--	--	false	true	true	false	fang duels	pre-dang-fools rule	post-dang-fools rule	--	--
"lazy"	"creep"	--	--	false	true	true	false	crazy leap	pre-lazy-creep rule	post-lazy-creep rule	--	--
"cool"	"tavern"	--	--	false	true	true	false	tool cavern	pre-cool-tavern rule	post-cool-tavern rule	--	--
"tool"	"cavern"	--	--	false	true	true	true	tool cavern	pre-tool-cavern rule	post-tool-cavern rule	--	--
"crass"	"mime"	--	--	false	true	true	false	mass crime	pre-crass-mime rule	post-crass-mime rule	--	--
"preening"	"school"	--	--	false	true	true	false	screening pool	pre-preening-school rule	post-preening-school rule	--	--
"muddy"	"wrench"	--	--	false	true	true	false	tool cavern	pre-muddy-wrench rule	post-muddy-wrench rule	--	--
"pricky"	"tile"	--	--	false	true	true	false	tricky pile	pre-pricky-tile rule	post-pricky-tile rule	--	--
"picky"	"trial"	--	--	false	true	true	false	tricky pile	pre-picky-trial rule	post-picky-trial rule	--	--

section fang duels scoring

a spoonerism rule (this is the pre-dang-fools rule):
	if player is not in fang duels, unavailable;
	if sco-dang-fools is true:
		vcal "You already expressed your contempt. Repeated expression of contempt may make you act like a dang fool at the wrong time in the near future.";
		already-done;
	ready;

this is the post-dang-fools rule:
	now sco-dang-fools is true;
	say "You realize aggression just wears people out. You express this brilliant philosophical belief eloquently. Either the entities involved are too intimidated by your intelligence, or they find you too wussy to bother with, or they just want to get away from your blather and continue fighting in peace.[paragraph break]But enough of them pulled back so you can now go north and south, and that's what really matters![paragraph break]You're a bit bummed you are in a text adventure and not a TV show, so you can't give kids one to grow on, but you still feel wise, and stuff.";

section crazy leap scoring

a spoonerism rule (this is the pre-lazy-creep rule):
	if player is not in crazy leap, unavailable;
	if creep is not in crazy leap:
		vcp "But there is no creep nearby to make lazy!";
		not-yet;
	if sco-lazy-creep is true:
		vcal "You already disposed of the creep!";
		already-done;
	ready;

this is the post-lazy-creep rule:
	now sco-lazy-creep is true;
	say "The sheddable creep suddenly looks exhausted and assures you you're not worth chasing and pestering any more. Whatever they wanted to pester you about, you just won't LEARN. They go off somewhere to find someone else to bug.";
	moot creep;
	now creep-chase is false;

section screening pool scoring

a spoonerism rule (this is the pre-preening-school rule):
	if player is not in screening pool, unavailable;
	if sco-preening-school is true:
		vcal "You already got past the screening pool!";
		already-done;
	ready;

this is the post-preening-school rule:
	now sco-preening-school is true;
	say "Ah, yes, you passed the 'test' of the screening pool. You are accepted to the preening school, where you do well. You're almost distressed at how well you do, because you are not that sort of person. But people praise how you mix humility with pomp. They could learn from you![paragraph break]You receive straight A's for your performance. You feel guilty having them. They look more like a scarlet letter than a medal. But you see no immediate way to get rid of them.";
	now the player has straight as;

section tool cavern scoring

a spoonerism rule (this is the pre-cool-tavern rule):
	if player is not in tool cavern, unavailable;
	if cavern-is-tavern is true:
		vcal "You already changed to the tavern!";
		already-done;
	ready;

this is the post-cool-tavern rule:
	now sco-cool-tavern is true;
	say "You focus and blink, and the cavern changes[one of][or] back[stopping] to a tavern.";
	say "[if ruddy mensch is off-stage]And someone is here! They introduce themselves, apologetically, as a ruddy mensch[else]Your friend the ruddy mensch is waiting[end if].";
	if player has muddy wrench:
		moot muddy wrench;
		moot ruddy mensch;
		say "The ruddy mensch thanks you and takes the wrench. They show you to a hidden passage south just once they fix that door there. They salute you and depart.";
		now tricky pile is mapped south of tool cavern;
		now tool cavern is mapped north of tricky pile;
		continue the action;
	move ruddy mensch to tool cavern;
	now cavern-is-tavern is true;

a spoonerism rule (this is the pre-tool-cavern rule):
	if player is not in tool cavern, unavailable;
	if muddy wrench is moot:
		vcal "You don't need to go back to the tool cavern.";
		already-done;
	ready;

this is the post-tool-cavern rule:
	say "You focus and blink, and the tavern changes[one of][or] back to[stopping] a cavern[if ruddy mensch is in tool cavern]. The ruddy mensch blurs out of view as well[end if].";
	now cavern-is-tavern is false;
	if ruddy mensch is in tool cavern, now ruddy mensch is in stride seat;

a spoonerism rule (this is the pre-muddy-wrench rule):
	if player is not in tool cavern, unavailable;
	if sco-cool-tavern is false, unavailable; [don't show this early]
	if cavern-is-tavern is true:
		vcp "Not (quite) here! Where might a muddy wrench be?";
		not-yet;
	if sco-muddy-wrench is true:
		vcal "You already got the muddy wrench!";
		already-done;
	ready;

this is the post-muddy-wrench rule:
	now sco-muddy-wrench is true;
	say "You know what to look for. It's hidden beneath newer, more glistening tools. But this muddy wrench has CHARACTER. You take it.";
	now player has muddy wrench;

section mass crime scoring

a spoonerism rule (this is the pre-crass-mime rule):
	if player is not in mass crime, unavailable;
	if sco-crass-mime is true:
		vcal "You already summoned the mime!";
		already-done;
	ready;

this is the post-crass-mime rule:
	now sco-crass-mime is true;
	say "A crass mime appears, annoying as can be, but at least not criminally annoying. And yet ... and yet ... they seem genuinely happy to see you.[paragraph break]Perhaps you will have to let them perform, to get what you want or need.";
	move crass mime to mass crime;

section tricky pile scoring

this is the tile-flip rule:
	if player is not in tricky pile, unavailable;
	if mime is moot:
		vcal "You already put the mime in all the situations you needed to.";
		already-done;

a spoonerism rule (this is the pre-pricky-tile rule):
	abide by the tile-flip rule;
	if mime-tile is true:
		vcal "You already got the mime to step on the tile!";
		already-done;
	if pile-status is 2:
		vcal "But the tile is already here!";
		already-done;
	ready;

this is the post-pricky-tile rule:
	now sco-pricky-tile is true;
	say "The tricky pile rearranges so there is pricky tile all around."; [?? bug check if it is already in a certain status]
	now pile-status is 2;

a spoonerism rule (this is the pre-picky-trial rule):
	abide by the tile-flip rule;
	if mime-trial is true:
		vcal "You already had the mime face a trial!";
		already-done;
	if pile-status is 1:
		vcal "But the trial is already here!";
		already-done;
	ready;

this is the post-picky-trial rule:
	now sco-picky-trial is true;
	say "The tricky pile rearranges to become an impromptu courtroom."; [?? bug check if it is already in a certain status]
	now pile-status is 1;

book west spoke

table of west spoke spoonerisms
w1 (text)	w2 (text)	posthom (topic)	hom-txt-rule (rule)	think-cue	okflip	core	idid	best-room	check-rule	run-rule	wfull (topic)	think-advice (text)
"slight"	"nudge"	--	--	false	true	true	false	night sludge	pre-slight-nudge rule	post-slight-nudge rule	--	--
"two"	"blooms"	--	--	false	true	true	false	blue tombs	pre-two-blooms rule	post-two-blooms rule	--	--
"perky"	"meanie"	--	--	false	true	true	false	blue tombs	pre-perky-meanie rule	post-perky-meanie rule	--	--
"rocking"	"blows"	--	--	false	true	true	false	blue tombs	pre-rocking-blows rule	post-rocking-blows rule	--	--
"pottery"	"wand"	--	--	false	true	true	false	watery pond	pre-pottery-wand rule	post-pottery-wand rule	--	--
"healing"	"farm"	--	--	false	true	true	false	feeling harm	pre-healing-farm rule	post-healing-farm rule	--	--
"sheddable"	"creep"	--	--	false	true	true	false	feeling harm	pre-sheddable-creep rule	post-sheddable-creep rule	--	--
"humorous"	"tome"	--	--	false	true	true	false	tumorous home	pre-humorous-tome rule	post-humorous-tome rule	--	--
"zap"	"true"	--	--	false	true	true	false	trap zoo	pre-zap-true rule	post-zap-true rule	--	--

section blue tombs scoring

a spoonerism rule (this is the pre-two-blooms rule):
	if player is not in blue tombs, unavailable;
	if sco-two-blooms is true:
		vcal "You already made the tombs crumble!";
		already-done;
	ready;

this is the post-two-blooms rule:
	now sco-two-blooms is true;
	say "The blue tombs crumble. Two flowers appear in their place. Huge, menacing flowers. A blocking rose and a murky peony. So going west still ain't happening. Yet.";
	move murky peony to blue tombs;
	move blocking rose to blue tombs;

section night sludge scoring

a spoonerism rule (this is the pre-slight-nudge rule):
	if player is not in night sludge, unavailable;
	if sco-slight-nudge is true:
		vcal "You already found a way through. It shouldn't be too bad to move on, now.";
		already-done;
	ready;

this is the post-slight-nudge rule:
	now sco-slight-nudge is true;
	say "You look around, hoping for a clue, and you find it. You scrape your foot along the path, and some parts are less icky than others. Specifically, ways north and south look okay.";

section blue tombs scoring

a spoonerism rule (this is the pre-rocking-blows rule):
	if player is not in blue tombs or blocking rose is moot, unavailable;
	if sco-perky-meanie is false:
		vcp "But the rocking blows would land on you!";
		not-yet;
	if sco-rocking-blows is true:
		vcal "You already showed the blocking rose what's what.";
		already-done;
	ready;

this is the post-rocking-blows rule:
	now sco-rocking-blows is true;
	say "The blocking rose turns against the perky meanie and gives it a good swat.";
	moot blocking rose;
	moot perky meanie;

a spoonerism rule (this is the pre-perky-meanie rule):
	if player is not in blue tombs or perky meanie is moot, unavailable;
	if sco-perky-meanie is true:
		vcal "You already summoned the perky meanie!";
		already-done;
	ready;

this is the post-perky-meanie rule:
	now sco-perky-meanie is true;
	say "The murky peony recedes, making way for a perky meanie. This seems temporarily more dangerous for you.";
	moot murky peony;
	move perky meanie to blue tombs;

section watery pond scoring

a spoonerism rule (this is the pre-pottery-wand rule):
	if player is not in watery pond, unavailable;
	if sco-pottery-wand is true:
		vcal "You already found the pottery wand!";
		already-done;
	ready;

this is the post-pottery-wand rule:
	now sco-pottery-wand is true;
	say "It's tricky, of course, looking in a watery pond without knowing what to look for. But since you do, you persevere, and you find it. It's both clay and something you'd expect to find in Harry Potter or whatever.";
	now player has pottery wand.

section tumorous home scoring

a spoonerism rule (this is the pre-humorous-tome rule):
	if player is not in tumorous home, unavailable;
	if sco-humorous-tome is true:
		vcal "You already discovered the humorous tome!";
		already-done;
	ready;

this is the post-humorous-tome rule:
	now sco-humorous-tome is true;
	say "Up pops a humorous tome! You have to admit, it's pretty funny. You can't understand it. Not much at all, really. Except, of course, for a basic weak spell. It comes off in your hand.";
	now player has weak spell;

section feeling harm scoring

a spoonerism rule (this is the pre-healing-farm rule):
	if player is not in feeling harm, unavailable;
	if sco-healing-farm is true:
		vcal "You've already made the farm!";
		already-done;
	ready;

this is the post-healing-farm rule:
	now sco-healing-farm is true;
	say "Everything feels much less stressful in short order. But ... there are some odd animals that pop up. Credible sheep, apparently. Or they seem to be.";
	move credible sheep to feeling harm;

a spoonerism rule (this is the pre-sheddable-creep rule):
	if player is not in feeling harm or sco-healing-farm is false, unavailable;
	if sco-sheddable-creep is true:
		vcal "You already got rid of the credible sheep!";
		already-done;
	ready;

this is the post-sheddable-creep rule:
	now sco-sheddable-creep is true;
	say "Wait! Those sheep look a little weird. Yeah, you're going to have to see about that ... yes, it's a disguise and not a very good one. A sheddable creep is behind them. But how to shed them?";
	moot credible sheep;
	move sheddable creep to feeling harm;
	now creep-chase is true;

section trap zoo scoring

a spoonerism rule (this is the pre-zap-true rule):
	if player is not in trap zoo, unavailable;
	if sco-zap-true is true:
		vcal "You already released animals from the trap zoo!";
		already-done;
	if zoo-score is 0:
		vcp "You have nothing magic that would help you zap anything.";
		not-yet;
	if zoo-score is 1:
		if sco-speak-well is true:
			vcp "You have nothing to cast the weak spell with.";
		else:
			vcp "You have nothing that the wand would help you cast.";
		not-yet;
	ready;

this is the post-zap-true rule:
	now sco-zap-true is true;
	say "With your pottery wand and weak spell you now thoroughly understand, you think you can release the trap zoo. You cast the spell, wait and ... there you go! The wand and spell both vaporize at the conclusion.";
	moot pottery wand;
	moot weak spell;
	solverg;

book endgame

table of endgame spoonerisms
w1 (text)	w2 (text)	posthom (topic)	hom-txt-rule (rule)	think-cue	okflip	core	idid	best-room	check-rule	run-rule	wfull (topic)	think-advice (text)
"so"	"well"	--	--	false	true	true	false	woe cell	pre-so-well rule	post-so-well rule	--	--
"oh"	"swell"	--	--	false	true	true	false	woe cell	pre-oh-swell rule	post-oh-swell rule	--	--
"thickening"	"suds"	--	--	false	true	true	false	woe cell	pre-thickening-suds rule	post-thickening-suds rule	--	--
"revolving"	"door"	--	--	false	true	true	false	wayfair cell	pre-revolving-door rule	post-revolving-door rule	--	--
"say"	"farewell"	--	--	false	true	true	false	wayfair cell	pre-say-farewell rule	post-say-farewell rule	--	--
"speak"	"mind"	--	--	false	true	true	false	bane row	pre-speak-mind rule	post-speak-mind rule	--	--
"rain"	"bow"	--	--	false	true	true	false	bane row	pre-rain-bow rule	post-rain-bow rule	"rainbow"	--
"stop"	"caring"	--	--	false	true	true	false	near my claim	pre-stop-caring rule	post-stop-caring rule	--	--
"clear"	"name"	--	--	false	true	true	false	near my claim	pre-clear-name rule	post-clear-name rule	"clear my name"	--

section woe cell scoring

a spoonerism rule (this is the pre-so-well rule):
	if player is not in woe cell, unavailable;
	if sco-so-well is true:
		vcal "You already showed general bemusement!";
		already-done;
	ready;

this is the post-so-well rule:
	now sco-so-well is true;
	say "You step back with general bemusement. It's therapeutic.";

a spoonerism rule (this is the pre-oh-swell rule):
	if player is not in woe cell, unavailable;
	if sco-so-well is false:
		vcp "You can't swing that yet in your current state of mind.";
		not-yet;
	if sco-oh-swell is true:
		vcal "You already showed sarcastic disgust!";
		already-done;
	ready;

this is the post-oh-swell rule:
	now sco-oh-swell is true;
	say "Hmmph. You complain to yourself. Does it have to end like this? No. It does not.[paragraph break]As you complain more, you find something more to complain about: sickening thuds!";
	move sickening thuds to woe cell;

a spoonerism rule (this is the pre-thickening-suds rule):
	if sickening thuds are not touchable, unavailable;
	ready;

this is the post-thickening-suds rule:
	now sco-thickening-suds is true;
	say "The sickening thuds which don't stop become thickening suds which keep pouring in. It's annoying to keep popping them, but you find yourself able to reach a bit higher as they pop and leave behind solid residue. Eventually you are able to climb out!";
	move player to wayfair cell;

section wayfair cell scoring

a spoonerism rule (this is the pre-revolving-door rule):
	if player is not in wayfair cell, unavailable;
	if sco-revolving-door is true:
		vcal "You already summoned a revolving door!";
		already-done;
	ready;

this is the post-revolving-door rule:
	now sco-revolving-door is true;
	say "A revolving door appears! Yay, a way out! But it seems stuck if you just push on it. Perhaps you need to show, definitively, that you really want to leave.";

a spoonerism rule (this is the pre-say-farewell rule):
	if location of player is not wayfair cell, unavailable;
	if sco-revolving-door is false:
		vcp "That'd be nice, but you have no way out, yet.";
		not-yet;
	ready;

this is the post-say-farewell rule:
	now sco-say-farewell is true;
	say "And just like that, you realize you shouldn't be bound by your own chains! You test the revolving door, and it budges. It's time to move on. And so you walk through the door. To ... somewhere even drearier. Well, it is Halloween. What did you expect?";
	move player to bane row;

section bane row scoring

a spoonerism rule (this is the pre-speak-mind rule):
	if player is not in bane row, unavailable;
	if sco-speak-mind is true:
		vcal "You already spoke your mind!";
		already-done;
	ready;

this is the post-speak-mind rule:
	now sco-speak-mind is true;
	say "You take charge of your emotions. You say something to someone, somewhere. You feel confident your words will have weight.";

a spoonerism rule (this is the pre-rain-bow rule):
	if player is not in bane row, unavailable;
	if sco-speak-mind is false:
		vcp "You're too meek-spined at the moment to admit a rainbow would be nice here.";
		not-yet;
	ready;

this is the post-rain-bow rule:
	now sco-rain-bow is true;
	say "Various undead voices grumble that this is all way too on-point, and you don't deserve to be happy. You ignore them as you admire, then cross, the rainbow. And yet ... you still feel you don't deserve whateve treasure is out there. You feel some implacable guilt for being you.";
	move player to near my claim;

section near my claim scoring

a spoonerism rule (this is the pre-stop-caring rule):
	if player is not in near claim, unavailable;
	if sco-stop-caring is true:
		vcal "You don't want to overdo the stop-caring angle, even if you overdid the caring angle in the past. You're in the right frame of mind.";
		already-done;
	ready;

this is the post-stop-caring rule:
	now sco-stop-caring is true;
	say "You feel relieved once you think of things in the near and distant past that you'd been carrying around that weren't really your fault.";

a spoonerism rule (this is the pre-clear-name rule):
	if player is not in near my claim, unavailable;
	if sco-stop-caring is false:
		vcp "You'd love to, but you still feel guilt! Unreasonable guilt, but guilt nonetheless.";
		not-yet;
	ready;

this is the post-clear-name rule:
	now sco-clear-name is true;
	say "You ignore the nonsense in your head. Even if you aren't a perfect person, dadgummit, you signed up for a treasure hunt, and treasure, you found!";
	if chunk-warn is false and player has treat chunk:
		say "[line break]And not only that, but you resisted the temptation to eat the treat chunk you found! That merits a bonus point!";
		up-min;
	if sco-cleared-woes is false:
		max-down;
	if cur-bonus is max-bonus:
		choose row with final response rule of show-misses rule in the Table of Final Question Options;
		blank out the whole row; [don't let the player see MISSED if they got everything]
	up-reg;
	follow the score and thinking changes rule;
	end the story finally;
	follow the shutdown rules;

volume big picture stuff

the check forks rule is listed first in the for printing a parser error rulebook.

rule for printing a parser error (this is the check forks rule):
	now partial-row is 0;
	abide by the main-spoonerism-checker rule for table of item spoonerisms;
	if debug-state is true, say "DEBUG INFO [mrlp]: [spoontable of mrlp], [firstdir of mrlp].";
	if firstdir of mrlp is not inside:
		abide by the main-spoonerism-checker rule for spoontable of mrlp;
	if partial-row > 0:
		say "Hmm. You are on the right track, there.";
		the rule succeeds;
	continue the action;

volume rule reorg

the wordguess rules are a table name based rulebook.

partial-row is a number that varies.

a wordguess rule for a table name (called tn) (this is the main-spoonerism-checker rule):
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
		let idid-before be idid entry;
		now idid entry is true;
		process the run-rule entry;
		if idid-before is false:
			if core entry is true:
				up-reg;
			else:
				up-min;
		follow the score and thinking changes rule;
		check-warp-home;
		now think-cue entry is false;
		the rule succeeds;

to check-warp-home:
	if balk-wack is true and mrlp is maxpointed and firstdir of mrlp is planar:
		say "[line break]You're done here in [the firstdir of mrlp]. Back to Ditch Park.";
		move player to ditch park;

volume runoff for later (?)

["howl"	"farm"	--	--	false	true	true	false	Ditch Park	pre-howl-farm rule	post-howl-farm rule
"keep"	"dry"	--	--	false	true	true	false	--	pre-keep-dry rule	post-keep-dry rule
"creep"	"die"	--	--	false	true	true	false	--	pre-creep-die rule	post-creep-die rule]

[this is the pre-howl-farm rule:
	if sco-howl-farm is true:
		vcal "You already opened passage to the howl farm.";
		already-done;
	ready;

this is the post-howl-farm rule:
	say "You feel a howl farm off to the side, which is creepy, but it's not physically dangerous.";
	now howl farm is mapped west of ditch park;
	now ditch park is mapped east of howl farm;
	now sco-howl-farm is true;

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
	now sco-creep-die is true;]

Roads of Liches Tables ends here.

---- DOCUMENTATION ----
