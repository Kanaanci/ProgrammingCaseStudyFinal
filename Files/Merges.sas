/*these sorts are required to merge the tables*/
/*sort the credits by movie title*/
proc sort data=Credits1 out=CTitle_sort;
	by title;
run;
/*sorts the movies 4 by title*/
proc sort data=Movies4 out=MTitle_sort;
	by title;
run;

/*
Merge the sorted movies and credits tables by title
Credits has far more movies in the data than the actual movies file
Put all the matches in MC_Match and put all the ones that did not have a match in MC_Unmatch
*/
data MC_Match MC_Unmatch;
	merge MTitle_sort(in=MTemp) CTitle_sort(in=CTemp);
	if MTemp = 1 and CTemp = 1
		then output MC_Match;
	else
		output MC_Unmatch;	
	by title;
run;

/*merge the oscars table with the previously merged movies and credits table*/
data MCO_Match MCO_Unmatch;
	merge Oscars2(in=OTemp) MC_Match(in=MCTemp);
	if(OTemp=1 and MCTemp=1) or (OTemp=0 and MCTemp=1) /*all values from previous table and matched from new*/
		then output MCO_Match;
	else
		output MCO_Unmatch;
	by title;
run;


