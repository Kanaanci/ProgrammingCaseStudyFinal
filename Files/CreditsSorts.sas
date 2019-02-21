/*Various sorts for the Credits tables base on the required task*/

/*sort the credits by the director*/
proc sort data=Credits1 out=CDirector_sort;
	by director;
run;

/*sort the credits by movie title*/
proc sort data=Credits1 out=CTitle_sort;
	by title;
run;