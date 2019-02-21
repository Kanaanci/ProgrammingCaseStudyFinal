/*
Pull the prouction countries 2 letter alpha code and clean the data
Using the sas table MAPSGFK.WORLD, which holds countries names, alpha codes, and latitude/longitude
*/

data MCountries;
	set Movies2;
	pcCount=count(production_countries, '{'); *count how many brackets;

	/*run a loop from 1 to the number of { to get the *nth word*/
	do i = 1 to pcCount;
		if i = 1
			then tempCountries=scan(production_countries, 4, '"'); *first alpha code is 4 words in;
		else
			tempCountries=scan(production_countries, ((i-1) * 8) + 4, '"'); *all the following codes are 8 words after the first;
		output;
	end;

	/*drop and rename appropriately*/
	keep tempCountries title;
	rename tempCountries=ISOALPHA2 ;
run;

/*sort the country codes for world and our countries. also make our own world table without duplicates*/
proc sort data=MCountries;
	by ISOALPHA2;
run;
proc sort data=mapsgfk.WORLD out=worldsort nodupkey;
	by ISOALPHA2;
run;

/*merge our countries alpha codes with the alpha codes from work to get all the longitudes and latitudes*/
data MCountriesMatch MCountriesUnmatch;
	merge Mcountries worldsort;
	by ISOALPHA2;
	keep ISOALPHA2 LAT LONG bubblesize;
run;

/*get the frequency of each country in this proc freq, then output that data into alphaCount*/
proc freq data=MCountriesMatch ;
	tables ISOALPHA2 / out=alphaCount;
run;

/*merge the counts of each country with the previously merged MCountriesMatch table*/
data MCountriesMatchCount;
	merge alphaCount MCountriesMatch;
	by ISOALPHA2;
run;

/*this will get rid of any duplicates in the final dataset while sorting*/
proc sort data=MCountriesMatchCount nodupkey;
	by ISOALPHA2;
run;