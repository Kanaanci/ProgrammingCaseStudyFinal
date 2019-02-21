/*create a report that shows the how many movies are categorized by genre and the average runtime of the genre*/
proc means data=Genre_split nonobs maxdec=0;
	var runtime;
	class genres;
run;

/*create a genre report that lists all movies by genre*/
proc print data=MGenre_sort;
	by genres;	
run;

/*create report grouped by release year and include those columns*/
ods html file="&path/movietitle.html";
proc print data=MCO_Match_TLSort (obs=100 drop=cast);
	by release_year; 
/*	by release_year title notsorted;*/
run;
ods html close;

%genre_search(genre1=action, genre2=adVenture, genre3=sCIENCE fiction);
%MCOFilter(year1=1985, year2=2010, financials='N', actor=johnny, lead=3);

/*create a map from the data MCountriesMatchCount where longitude and latitude are x and y and size is
is the frequency of movies released in each country*/
proc sgmap plotdata=MCountriesMatchCount;
    esrimap url='http://services.arcgisonline.com/arcgis/rest/services/World_Physical_Map';
            bubble x=LONG y=LAT size=COUNT;
run;
