/*take the movies credits oscars table and turn the titles into hyperlinks*/
data MCO_Match_TitleLink;
	retain newtitle title release_date release_year runtime tagline revenue 
		   budget profitability cast_size director award name winner; *reorder column names;
	set MCO_Match;
	length newtitle $ 300.; *variable for new hyper link title;

	/*if the homepage has a link then make it into html, if not then leave it be title*/	
	if(homepage ne ' ') then
		newtitle=catt('<a href="', homepage, '">', title, '</a>');
	else
		newtitle = title;
	
	keep release_date release_year cast tagline runtime budget revenue profitability newtitle cast_size director winner award name;
	rename newtitle=title;
run;

/*sort the movies credits and oscars merge*/
proc sort data=MCO_Match_TitleLink out=MCO_Match_TLSort;
	by release_date;
run;