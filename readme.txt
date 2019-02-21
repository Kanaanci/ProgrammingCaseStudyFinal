Starting the project:
	Open the 'CaseStudy2.egp' project file in SAS Enterprise Guide
	Once the project is open, navigate to the Project Tree, where you will find a folder 'Programs'
	Expand the programs folder and you will see various SAS data files, find the one named 'setup' and open it
	Once the file is open, change the '%let path=...." to the directory you have the program files stored
	After the path is changed, with the file still open, select the 'Run' button at the top of the program or press 'F3'
	Doing so will run all the necessary files to import the data, clean the data, and populate all the necessary data tables

Pulling the required CaseStudy reports:
	Find the 'Reports' file in the 'Programs' folder and open it (this will be in the same folder 'setup' was found
	Once the file is open you will see various 'proc prints' and 'proc reports' along with some macros
	Above every one of these entries are comments describing the type of output you will receive when running these
	To run, select the report you would like to see, highlight the selection, and press 'Run' or 'F3'
	


What's in all of these data files?
	setup - this file sets the a macro variable 'path' to your directory, then calls the other files to run and populate
	InitialImports - this file takes the 3 external data files and imports them, with 'proc import' and 'infile' imports, to SAS data tables
	Movies1..Movies4 - these files clean and validate the data of the imported Movies data into the data we want to see and work with
	MoviesGenreSplit - this file takes every movies genre and prints them out independently, this is used for some reports we generate
	MoviesSorts - this is so we can sort the Movies in various formats, used for sorts and merges
	Credits1 - this cleans the imports Movies Credits table to a data set that we want to work with
	CreditsSorts - various sorts for the Credits data, used for merges and reports
	Oscars1 & Oscars2 - this will clean the imported Oscars data to formats and the requirements we need for the reports and merges
	Merges - this holds all the merges we did for Movies and Credits data
	Merges_MCO_TL - where we merge the Oscars table to the previously merged Movies and Credits table, while added hyperlinks to the titles
	MoviesGSearchMacro - a macro that takes up to 3 genres as parameters and returns only the movies that fit the genres specified
	MCOFilterMacro - a macro that has 5 parameters (year1 year2 financials actor lead) where the user can filter by a single year or between two years
			 also can have movie financials displayed. Filter by actor and specify how many lead actors we want to display in the table
	ProductionCountries - this file takes the Movies data and creates a table that can later be used to populate a map based on the frequency
			      of movies released per country based on a bubble size
	Reports - this file generates all of the required reports for the case study
	testing - this is where the data validation testing was done to ensure accuracy