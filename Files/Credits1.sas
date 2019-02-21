/*pull out the director and count the cast size*/

data Credits1;
	set Credits;
	length tempCast $100.;
	cast_size=count(cast, '{'); *pattern is 1 { per person;
	dlocation=find(crew, 'Director"', 1); *find the string location 'Director"';
	dsubstr=substr(crew, dlocation, 75); *after that string is found get a substr from the location to 75 after;
	director=scan(dsubstr, 5, '"'); *scan the 5th word in that substr delimitted by " to get the directors name;
	
	do i = 1 to 5;
		if i = 1 then do;
			newCast=scan(cast,18 * i,'"');
			tempcast=catx(',', tempcast, newCast);
		end;
		else if i = 2 then do;
			newCast=scan(cast,(18 * i) + 2,'"');
			tempcast=catx(',', tempcast, newCast);
		end;
		else if i = 3 then do;
			newCast=scan(cast,(18 * i) + 4,'"');
			tempcast=catx(',', tempcast, newCast);
		end;
		else if i = 4 then do;
			newCast=scan(cast,(18 * i) + 6,'"');
			tempcast=catx(',', tempcast, newCast);
		end;
		else do;
			newCast=scan(cast,(18 * i) + 8,'"');
			tempcast=catx(',', tempcast, newCast);
		end;
	end;

	/*some directors arent listed so they arent available*/
	if(director=' ') 
		then director = 'Not available';

	drop crew dsubstr dlocation newcast cast 'movie id'n;
	rename tempcast=cast;
run;