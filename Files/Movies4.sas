/*reorder columns and make the profitability column*/
data Movies4;
	retain title release_date runtime tagline revenue budget profitability; *reorder column names;
	set Movies3;
	length profitability $20;

	if(budget = 'Not Available' or revenue = 'Not Available')
		then profitability = 'Not Available';
	else
		profitability = revenue - budget; *variable for profitability;
	release_year = year(release_date); *variable for year of release;

	keep release_date release_year tagline runtime budget revenue profitability title homepage;
run;