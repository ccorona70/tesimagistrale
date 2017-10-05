{\rtf1\ansi\ansicpg1252\cocoartf1504\cocoasubrtf830
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 CREATE TABLE ontime ( \
	Year NUMBER NULL,\
	Quarter NUMBER NULL,\
	Month number NULL,\
	DayofMonth number NULL,\
	DayOfWeek number NULL,\
	FlightDate Date NULL,\
	UniqueCarrier Char( 7 )  NULL,\
	AirlineID number NULL,\
	Carrier varchar( 2 )NULL,\
	TailNum VarChar( 50 )NULL,\
	FlightNum VarChar( 10 )NULL,\
	OriginAirportID number NULL,\
	OriginAirportSeqID number NULL,\
	OriginCityMarketID number NULL,\
	Origin Char( 5 )NULL,\
	OriginCityName VarChar( 100 )NULL,\
	OriginState Char( 2 )NULL,\
	OriginStateFips VarChar( 10 )NULL,\
	OriginStateName VarChar( 100 )NULL,\
	OriginWac number NULL,\
	DestAirportID number NULL,\
	DestAirportSeqID number NULL,\
	DestCityMarketID number NULL,\
	Dest Char( 5 )NULL,\
	DestCityName VarChar( 100 )NULL,\
	DestState Char( 2 )NULL,\
	DestStateFips VarChar( 10 )NULL,\
	DestStateName VarChar( 100 )NULL,\
	DestWac number NULL,\
	CRSDepTime number NULL,\
	DepTime number NULL,\
	DepDelay number NULL,\
	DepDelayMinutes number NULL,\
	DepDel15 number NULL,\
	DepartureDelayGroups number NULL,\
	DepTimeBlk VarChar( 20 )NULL,\
	TaxiOut number NULL,\
	WheelsOff number NULL,\
	WheelsOn number NULL,\
	TaxiIn number NULL,\
	CRSArrTime number NULL,\
	ArrTime number NULL,\
	ArrDelay number NULL,\
	ArrDelayMinutes number NULL,\
	ArrDel15 number NULL,\
	ArrivalDelayGroups number NULL,\
	ArrTimeBlk VarChar( 20 )NULL,\
	Cancelled number NULL,\
	CancellationCode Char( 1 )NULL,\
	Diverted number NULL,\
	CRSElapsedTime number NULL,\
	ActualElapsedTime number NULL,\
	AirTime number NULL,\
	Flights number NULL,\
	Distance number NULL,\
	DistanceGroup number NULL,\
	CarrierDelay number NULL,\
	WeatherDelay number NULL,\
	NASDelay number NULL,\
	SecurityDelay number NULL,\
	LateAircraftDelay number NULL,\
	FirstDepTime VarChar( 10 )NULL,\
	TotalAddGTime VarChar( 10 )NULL,\
	LongestAddGTime VarChar( 10 )NULL,\
	DivAirportLandings VarChar( 10 )NULL,\
	DivReachedDest VarChar( 10 )NULL,\
	DivActualElapsedTime VarChar( 10 )NULL,\
	DivArrDelay VarChar( 10 )NULL,\
	DivDistance VarChar( 10 )NULL,\
	Div1Airport VarChar( 10 )NULL,\
	Div1AirportID number NULL,\
	Div1AirportSeqID number NULL,\
	Div1WheelsOn VarChar( 10 )NULL,\
	Div1TotalGTime VarChar( 10 )NULL,\
	Div1LongestGTime VarChar( 10 )NULL,\
	Div1WheelsOff VarChar( 10 )NULL,\
	Div1TailNum VarChar( 10 )NULL,\
	Div2Airport VarChar( 10 )NULL,\
	Div2AirportID number NULL,\
	Div2AirportSeqID number NULL,\
	Div2WheelsOn VarChar( 10 )NULL,\
	Div2TotalGTime VarChar( 10 )NULL,\
	Div2LongestGTime VarChar( 10 )NULL,\
	Div2WheelsOff VarChar( 10 )NULL,\
	Div2TailNum VarChar( 10 )NULL,\
	Div3Airport VarChar( 10 )NULL,\
	Div3AirportID number NULL,\
	Div3AirportSeqID number NULL,\
	Div3WheelsOn VarChar( 10 )NULL,\
	Div3TotalGTime VarChar( 10 )NULL,\
	Div3LongestGTime VarChar( 10 )NULL,\
	Div3WheelsOff VarChar( 10 )NULL,\
	Div3TailNum VarChar( 10 )NULL,\
	Div4Airport VarChar( 10 )NULL,\
	Div4AirportID number NULL,\
	Div4AirportSeqID number NULL,\
	Div4WheelsOn VarChar( 10 )NULL,\
	Div4TotalGTime VarChar( 10 )NULL,\
	Div4LongestGTime VarChar( 10 )NULL,\
	Div4WheelsOff VarChar( 10 )NULL,\
	Div4TailNum VarChar( 10 )NULL,\
	Div5Airport VarChar( 10 )NULL,\
	Div5AirportID number NULL,\
	Div5AirportSeqID number NULL,\
	Div5WheelsOn VarChar( 10 )NULL,\
	Div5TotalGTime VarChar( 10 )NULL,\
	Div5LongestGTime VarChar( 10 )NULL,\
	Div5WheelsOff VarChar( 10 )NULL,\
	Div5TailNum VarChar( 10 )NULL )\
}