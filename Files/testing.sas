/*THIS FILE IS JUST FOR TESTING PURPOSED ONLY*/
/*Print obersvations to check some of the data*/

proc print data=Movies4 (obs=100);
run;

proc print data=Oscars2 (firstobs=315 obs=400);
run;

proc print data=Credits1;
run;

proc contents data=Movies4;
run;

proc contents data=Oscars2;
run;

proc contents data=Credits1;
run;