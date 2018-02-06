% AI Project #1: Family Tree
% Program by: Chris G.
% Created On: January 30, 2018
% COMPSCI 469: Introduction to Artificial Intelligence
% Professor Steven Wirz

% Facts first (male, female, married, parent) 
% Using :-discontiguous ... to suppress discontiguous definition of predicate warning
:-discontiguous male/1, female/1, parent/2, married/2.

% New Generation
male('Isaiah T').
male('Sebastian R').
female('Angelique S').

% My Generation
male('Chris G').
female('Sabrina G').
female('Camilla G').
female('Belen S').
male('Roman S').
female('Valerie R').
male('Danny R').
male('Mario T Jr').
female('Joanna T').
male('Marvin T').
male('Abraham T').
female('Devon B').
female('Lauren B').
female('Sophia B').
male('Enzo B').
female('Mia B').
male('Aaron B').
male('Joel B').
female('Fabi B').
female('Jacqueline B').
male('Lucas R').

% Second Cousins
male('Zac R').
male('Daniel R').
female('Cyntia R').
male('Adrian B').
male('Toby B').

married('Roman S', 'Belen S').
married('Mario T Jr', 'Joanna T').
married('Danny R', 'Valerie R').

parent('Mario T Jr', 'Isaiah T').
parent('Joanna T', 'Isaiah T').
parent('Danny R', 'Sebastian R').
parent('Valerie R', 'Sebastian R').
parent('Roman S', 'Angelique S').
parent('Belen S', 'Angelique S').

% Parent Generation
male('Adam G Jr').
female('Griselda G').
male('Bert R').
female('Heidi R').
male('Joe B').
female('Martha B').
male('Tony B').
female('Ari B').
male('Cesar B').
female('Eve B').
male('Mike B').
male('Sal B').
female('Jenny T').
male('Mario T Sr'). 
female('Martha O').
male('Miguel O').

% Second Relatives
male('Gabriel B').
female('Sonia B').
female('Maribel B').
male('Martin R').

married('Adam G Jr', 'Griselda G').
married('Bert R', 'Heidi R').
married('Joe B', 'Martha B').
married('Tony B', 'Ari B').
married('Cesar B', 'Eve B').
married('Mario T Sr', 'Jenny T').
married('Miguel O', 'Martha O').
married('Gabriel B', 'Sonia B').
married('Martin R', 'Maribel B').

parent('Adam G Jr', 'Chris G').
parent('Adam G Jr', 'Sabrina G').
parent('Adam G Jr', 'Camilla G').
parent('Griselda G', 'Chris G').
parent('Griselda G', 'Sabrina G').
parent('Griselda G', 'Camilla G').
parent('Bert R', 'Lucas R').
parent('Heidi R', 'Lucas R').
parent('Joe B', 'Jacqueline B').
parent(unknown1, 'Jacqueline B').
parent('Tony B', 'Mia B').
parent('Tony B', 'Aaron B').
parent('Ari B', 'Mia B').
parent('Ari B', 'Aaron B').
parent(unknown, 'Abraham T').
parent('Cesar B', 'Devon B').
parent('Cesar B', 'Lauren B').
parent('Cesar B', 'Sophia B').
parent('Cesar B', 'Enzo B').
parent('Eve B', 'Abraham T').
parent('Eve B', 'Devon B').
parent('Eve B', 'Lauren B').
parent('Eve B', 'Sophia B').
parent('Eve B', 'Enzo B').
parent('Mario T Sr', 'Belen S').
parent('Mario T Sr', 'Valerie R').
parent('Mario T Sr', 'Mario T Jr').
parent('Mario T Sr', 'Marvin T').
parent('Jenny T', 'Belen S').
parent('Jenny T', 'Valerie R').
parent('Jenny T', 'Mario T Jr').
parent('Jenny T', 'Marvin T').
parent('Miguel O', 'Joel O').
parent('Miguel O', 'Fabi O').
parent('Martha O', 'Joel O').
parent('Martha O', 'Fabi O').
parent('Gabriel B', 'Adrian B').
parent('Gabriel B', 'Toby B').
parent('Sonia B', 'Adrian B').
parent('Sonia B', 'Toby B').
parent('Maribel B', 'Zac R').
parent('Maribel B', 'Daniel R').
parent('Maribel B', 'Cynthia R').
parent('Martin R', 'Zac R').
parent('Martin R', 'Daniel R').
parent('Martin R', 'Cynthia R').

% Grandparent Generation
male('Emiliano B').
female('Genoveva B').
male('Adam G Sr').
female('Julia G').

% Second Relatives
female('Lidia G').
male('Salvador B').

married('Emiliano B', 'Genoveva B').
married('Adam G Sr', 'Julia G').
married('Salvador B', 'Lidia G').

parent('Emiliano B', 'Martha O').
parent('Emiliano B', 'Jenny T').
parent('Emiliano B', 'Sal B').
parent('Emiliano B', 'Mike B').
parent('Emiliano B', 'Cesar B').
parent('Emiliano B', 'Tony B').
parent('Emiliano B', 'Joe B').
parent('Emiliano B', 'Griselda G').
parent('Genoveva B', 'Martha O').
parent('Genoveva B', 'Jenny T').
parent('Genoveva B', 'Sal B').
parent('Genoveva B', 'Mike B').
parent('Genoveva B', 'Cesar B').
parent('Genoveva B', 'Tony B').
parent('Genoveva B', 'Joe B').
parent('Genoveva B', 'Griselda G').
parent('Adam G Sr', 'Adam G Jr').
parent('Adam G Sr', 'Heidi R').
parent('Julia G', 'Adam G Jr').
parent('Julia G', 'Heidi R').
parent('Lidia G', 'Gabriel B').
parent('Lidia G', 'Maribel B').
parent('Salvador B', 'Gabriel B').
parent('Salvador B', 'Maribel B').

% Great Grandparent Generation
male('Jose G').
female('Esperanza S').

married('Jose G', 'Esperanza S').

parent('Jose G', 'Julia G').
parent('Esperanza S', 'Julia G').
parent('Jose G', 'Lidia G').
parent('Esperanza S', 'Lidia G').


% Family Relationship Rules
% (Father, Mother, Husband, Wife, Son, Daughter, Brother, Sister, Cousin, Uncle, 
% Aunt, Grandpa, Grandma, Ancestor) 

% Intermediate utility rule to utilize in other rules. Used so that married(X, Y) and 
% married(Y, X) are treated as the same.
spouse(Spouse1, Spouse2) :- married(Spouse1, Spouse2); married(Spouse2, Spouse1).

% father if parent && male
father(Father, Child) :- male(Father), parent(Father, Child).

% Similarly for mother
mother(Mother, Child) :- female(Mother), parent(Mother, Child).

% husband if married and male
husband(Husband, X) :- spouse(Husband, X), male(Husband).

% Similarly for wife
wife(Wife, X) :- spouse(Wife, X), female(Wife).

% Step-parent == child of Parent X and Parent Y with both parents having different spouses
step_parent(Nonbio, X) :- parent(Bio, X), parent(Bio2, X), spouse(Bio, Nonbio), 
    						Bio \= Bio2, Bio2 \= Nonbio.

% Easy to do gender version of more general rules, just add male/female conditions
step_father(SFather, X) :- step_parent(SFather, X), male(SFather).
step_mother(SMother, X) :- step_parent(SMother, X), female(SMother).

% Parent-In-Law is spouse's parent
parent_in_law(PInLaw, X) :- spouse(X, Spouse), parent(PInLaw, Spouse).

% parent_in_law && female
mother_in_law(MInLaw, X) :- parent_in_law(MInLaw, X), female(MInLaw).

% parent_in_law && male
father_in_law(FInLaw, X) :- parent_in_law(FInLaw, X), male(FInLaw).

% Intermediate rule 'child' to make son/2, daughter/2 easier
% Basically the inverse of parent
child(Child, Parent) :- parent(Parent, Child).

% son == child && male
son(Son, Parent) :- child(Son, Parent), male(Son).

% Similarly for daughter
daughter(Daughter, Parent) :- child(Daughter, Parent), female(Daughter).

% Intermediate rule 'siblings' to make brother/2, sister/2 easier
% siblings if they have the same mother (Y) && father (X) && Sibling1 != Sibling2
siblings(Sib1, Sib2) :- father(X, Sib1), father(X, Sib2), mother(Y, Sib1), 
    						mother(Y, Sib2), Sib1 \= Sib2.

% half-siblings if Sib1 and Sib2 share the same parent (X), but share different parents 
% (Y and Z) where X, Y, Z, Sib1, and Sib2 do not equal each other (obviously)
half_siblings(Sib1, Sib2) :- parent(X, Sib1), parent(X, Sib2), parent(Y, Sib1),
    							parent(Z, Sib2), X \= Y, X \= Z, Y \= Z, Sib1 \= Sib2.

% brother if male && siblings
brother(Brother, Sibling2) :- male(Brother), siblings(Brother, Sibling2).

% Similarly for sister
sister(Sister, Sibling2) :- female(Sister), siblings(Sister, Sibling2).

% half-brother if half-sibling && male
half_brother(HBrother, Sibling) :- half_siblings(HBrother, Sibling), male(HBrother).

% Similarly for half-sister
half_sister(HSister, Sibling) :- half_siblings(HSister, Sibling), female(HSister).

% in_law is sibling's spouse || spouse's siblings
sibling_in_laws(In_Law, X) :- siblings(X, Sibling), spouse(In_Law, Sibling); 
    							spouse(X, Spouse), siblings(In_Law, Spouse).

% sibling_in_laws && male
brother_in_law(BInLaw, X) :- sibling_in_laws(BInLaw, X), male(BInLaw).

% sibling_in_laws && female
sister_in_law(SInLaw, X) :- sibling_in_laws(SInLaw, X), female(SInLaw).

% uncle if Sibling with X's Parent && male || aunt's husband
uncle(Uncle, X) :- parent(Parent, X), siblings(Uncle, Parent), male(Uncle); 
    				parent(Parent, X), siblings(Aunt, Parent), husband(Uncle, Aunt).

% aunt if Parent is Sibling && Female || Uncle's (Parent's Sibling) Wife
aunt(Aunt, X) :- parent(Parent, X), siblings(Aunt, Parent), female(Aunt); 
    				parent(Parent, X), siblings(Uncle, Parent), wife(Aunt, Uncle).

% grand-uncle is grandparent's brother || grandparent's sister's husband
grand_uncle(Uncle, X) :- grandparent(GR, X), brother(Uncle, GR); grandparent(GR, X), sister(Sister, GR), 
    						husband(Uncle, Sister).

% grand-aunt is grandparent's sister || grandparent's brother's wife
grand_aunt(Aunt, X) :- grandparent(GR, X), sister(Aunt, GR); grandparent(GR, X), brother(Brother, GR), 
    					wife(Aunt, Brother).

% Nephew is your sibling's son || sibling-in-law's son
nephew(Nephew, X) :- siblings(Sibling, X), son(Nephew, Sibling); sibling_in_laws(InLaw, X), son(X, InLaw).

% Niece is the same but with daughter
niece(Niece, X) :- siblings(Sibling, X), daughter(Niece, Sibling); sibling_in_laws(InLaw, X), 
    				daughter(X, InLaw).

% Sibling's grandson || sibling-in-law's grandson
grand_nephew(Nephew, X) :- siblings(Sibling, X), grandson(Nephew, Sibling); sibling_in_laws(InLaw, X),
    						grandson(Nephew, InLaw).

% Sibling's granddaughter || sibling-in-law's granddaughter
grand_niece(Niece, X) :- siblings(Sibling, X), granddaughter(Niece, Sibling); sibling_in_laws(InLaw, X),
    						granddaughter(Niece, InLaw).

% cousin if X's parent has a sibling with children
cousin(Cousin, X) :- parent(Parent, X), siblings(Parent, Relation), parent(Relation, Cousin).

% cousin once removed (Relation: First cousin's child, ALSO parent's first cousin)
% Logic: Find your cousin (Parent), if they have a child this will return the correct result (Cousin) ||
% Find X's Parent, their Cousin is the result 
cousin_once_removed(Cousin, X) :- cousin(Parent, X), child(Cousin, Parent); parent(Parent, X), 
    								cousin(Cousin, Parent).

% Second Cousin is the child of your parent's cousin
% Logic: Find X's Parent. Find Parent's cousin, Relation, (That is your cousin once removed!)
% Cousin is then Relation's Child. (Sidenote: Your cousin's children's (Also your cousin once removed)
% children are also your second cousins so this works as well.)
second_cousin(Cousin, X) :- cousin_once_removed(Relation, X), child(Cousin, Relation).

% grandparent if parent of X is the child of GR
grandparent(GR, X) :- parent(Parent, X), child(Parent, GR).

% grandma/grandpa if grandparent && female/male
grandma(GR, X) :- grandparent(GR, X), female(GR).
grandpa(GR, X) :- grandparent(GR, X), male(GR).

% Grandchild is X's Child's child
grandchild(GC, X) :- child(Child, X), child(GC, Child).

% Grandson/Granddaughter if grandchild && male/female.
grandson(GS, X) :- grandchild(GS, X), male(GS).
granddaughter(GD, X) :- grandchild(GD, X), female(GD).

% Grandparent's parent
great_grandparent(GP, X) :- grandparent(GR, X), parent(GP, GR).

% great_grandparent && female/male
great_grandma(GM, X) :- great_grandparent(GM, X), female(GM).
great_grandpa(GP, X) :- great_grandparent(GP, X), male(GP).


