/*Various sorts for Movies based on the task required*/

/*sorts the split up genres*/
proc sort data=Genre_split
	out=MGenre_sort (keep=genres title runtime);
	by genres;
run;


/*sorts the movies 4 by title*/
proc sort data=Movies4 out=MTitle_sort;
	by title;
run;


/*sort the movies 4 by release date*/
proc sort data=Movies4 out=MYear_sort;
	by release_date;
run;

/*sort the titles of the movies with hyper link titles*/
/*proc sort data=MTitle_link out=MTitle_link_tsort;*/
/*	by title;*/
/*run;*/