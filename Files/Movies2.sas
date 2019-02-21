/*
Pull the keywords and companies to clean data
This is not required but completed anyways
*/

data Movies2;
	set Movies1;

	length newKeywords $200 newCompanies $200; *initialize to prevent default numeric type;
	kCount=count(keywords, '{'); *count brackets;

	do i = 1 to kCount; *run 1 to bracket count;
		/*scan keywords and pull out the 6*nth word delimitted by " and the concatenate the strings with a , delimiter*/
		tempKeywords=scan(keywords, 6*i, '"');
		newKeywords=catx(', ', tempKeywords, newKeywords);
	end;

	pCount=count(production_companies, '{'); *count the brackets to get company count;
	do j = 1 to pCount;
		if (j = 1)
			then tempCompanies = scan(production_companies, 4, '"');
		else 
		/*the first company is the 4th word in, the following are 6 after.*/
		tempCompanies = scan(production_companies, 6 * (j-1) + 4, '"');	
		newCompanies=catx(', ', newCompanies, tempCompanies);
	end;

	/*drop those old keywords columns and rename the good one to just keywords*/
	drop keywords tempKeywords i j kCount pCount tempCompanies production_companies spoken_languages;
	rename newKeywords=keywords newCompanies=production_companies;
run;