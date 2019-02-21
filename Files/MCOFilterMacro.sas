/*macro to filter the years, whether or not to display financials, filter by actor, and display user entered lead actors*/
%macro MCOFilter(year1=, year2=, financials=, actor=, lead=);
data MCO_Macro;
	set MCO_Match_TLSort;
	length lead $150.;
	
	%if (&year2=) %then %do; /*if they only entered one year search movies in that year*/
		where release_year = &year1;
	%end;
	%else %do; /*if they entered two then search between those years*/
		where release_year between &year1 and &year2;
	%end;

	%if (&actor=) %then %do;/*if they didnt enter an actor then dont do anything*/
	%end;
	%else %do; /*if they entered actor then search for actors in cast*/
		where also lowcase(cast) like "%nrstr(%%)&actor%nrstr(%%)";
	%end;
	%if (&lead=) %then %do; /*how many leads do we display*/
	%end;
	%else %do;/*pull out the user entered amount of leads from the top 5 cast*/
		do i = 1 to &lead + 1;
			templead=scan(cast, i, ',');
			lead=catx(',', lead, templead);
		end;
	%end;

	/*if the user wants the financials or not*/
	%if (&financials='n' or &financials='N') %then %do; 
			drop budget revenue i templead;
	%end;
	%else %do;
		drop i templead;
	%end;

	run;
	
	ods html file="&path/movietitle.html";
	proc print data=MCO_Macro;
	run;
	ods html close;
%mend;