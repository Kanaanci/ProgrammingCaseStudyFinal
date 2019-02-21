/*****Import Movies*****/
proc import datafile="&path./movies.csv" dbms=csv 
	out=Movies replace;
	guessingrows=max;
run;


/*****Import Credits*****/
proc import datafile="&path./credits.xlsx" dbms=xlsx 
	out=Credits replace;
run;

/*****Import Oscars*****/
data work.Oscars;
	infile "&path./oscars.txt" truncover;
	retain newYear newCeremony; *hold these to populate the empty fields;

	/*get the data from these locations in the .txt file*/
	input @1 year 9.
		  @11 ceremony 2.
	   	  @14 winner $ 6.
		  @21 Other $ 200.;

	/*splitting up the 'Other' column by the delimiter*/
	length award $150 name $150 film $200;
	award=scan(Other,1,'|');
	film=scan(Other,2,'|');
	name=scan(Other,3,'|');

	/*if the year and ceremony have a value, set that as the new retaining value to be populated*/
	if year ne . then newYear=year;
	if ceremony ne . then newCeremony=ceremony;

	/*get rid of the old year and ceremony columns and rename the new ones to match*/
	drop year ceremony other;
	rename newYear=year newCeremony=ceremony;
run;