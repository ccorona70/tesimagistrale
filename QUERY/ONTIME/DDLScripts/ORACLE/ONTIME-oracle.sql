{\rtf1\ansi\ansicpg1252\cocoartf1504\cocoasubrtf830
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 CREATE TABLE ontime (\
  Year number DEFAULT NULL,\
  Quarter number DEFAULT NULL,\
  Month number DEFAULT NULL,\
  DayofMonth number DEFAULT NULL,\
  DayOfWeek number DEFAULT NULL,\
  FlightDate date DEFAULT NULL,\
  UniqueCarrier varchar2(7) DEFAULT NULL,\
  AirlineID number DEFAULT NULL,\
  Carrier varchar2(2)DEFAULT NULL,\
  TailNum varchar2(50) DEFAULT NULL,\
  FlightNum varchar2(10) DEFAULT NULL,\
  OriginAirportID number DEFAULT NULL,\
  OriginAirportSeqID number DEFAULT NULL,\
  OriginCityMarketID number DEFAULT NULL,\
  Origin char(5) DEFAULT NULL,\
  OriginCityName varchar2(100) DEFAULT NULL,\
  OriginState varchar2(2)DEFAULT NULL,\
  OriginStateFips varchar2(10) DEFAULT NULL,\
  OriginStateName varchar2(100) DEFAULT NULL,\
  OriginWac number DEFAULT NULL,\
  DestAirportID number DEFAULT NULL,\
  DestAirportSeqID number DEFAULT NULL,\
  DestCityMarketID number DEFAULT NULL,\
  Dest char(5) DEFAULT NULL,\
  DestCityName varchar2(100) DEFAULT NULL,\
  DestState varchar2(2)DEFAULT NULL,\
  DestStateFips varchar2(10) DEFAULT NULL,\
  DestStateName varchar2(100) DEFAULT NULL,\
  DestWac number DEFAULT NULL,\
  CRSDepTime number DEFAULT NULL,\
  DepTime number DEFAULT NULL,\
  DepDelay number DEFAULT NULL,\
  DepDelayMinutes number DEFAULT NULL,\
  DepDel15 number DEFAULT NULL,\
  DepartureDelayGroups number DEFAULT NULL,\
  DepTimeBlk varchar2(20) DEFAULT NULL,\
  TaxiOut number DEFAULT NULL,\
  WheelsOff number DEFAULT NULL,\
  WheelsOn number DEFAULT NULL,\
  TaxiIn number DEFAULT NULL,\
  CRSArrTime number DEFAULT NULL,\
  ArrTime number DEFAULT NULL,\
  ArrDelay number DEFAULT NULL,\
  ArrDelayMinutes number DEFAULT NULL,\
  ArrDel15 number DEFAULT NULL,\
  ArrivalDelayGroups number DEFAULT NULL,\
  ArrTimeBlk varchar2(20) DEFAULT NULL,\
  Cancelled number DEFAULT NULL,\
  CancellationCode char(1) DEFAULT NULL,\
  Diverted number DEFAULT NULL,\
  CRSElapsedTime number DEFAULT NULL,\
  ActualElapsedTime number DEFAULT NULL,\
  AirTime number DEFAULT NULL,\
  Flights number DEFAULT NULL,\
  Distance number DEFAULT NULL,\
  DistanceGroup number DEFAULT NULL,\
  CarrierDelay number DEFAULT NULL,\
  WeatherDelay number DEFAULT NULL,\
  NASDelay number DEFAULT NULL,\
  SecurityDelay number DEFAULT NULL,\
  LateAircraftDelay number DEFAULT NULL,\
  FirstDepTime varchar2(10) DEFAULT NULL,\
  TotalAddGTime varchar2(10) DEFAULT NULL,\
  LongestAddGTime varchar2(10) DEFAULT NULL,\
  DivAirportLandings varchar2(10) DEFAULT NULL,\
  DivReachedDest varchar2(10) DEFAULT NULL,\
  DivActualElapsedTime varchar2(10) DEFAULT NULL,\
  DivArrDelay varchar2(10) DEFAULT NULL,\
  DivDistance varchar2(10) DEFAULT NULL,\
  Div1Airport varchar2(10) DEFAULT NULL,\
  Div1AirportID number DEFAULT NULL,\
  Div1AirportSeqID number DEFAULT NULL,\
  Div1WheelsOn varchar2(10) DEFAULT NULL,\
  Div1TotalGTime varchar2(10) DEFAULT NULL,\
  Div1LongestGTime varchar2(10) DEFAULT NULL,\
  Div1WheelsOff varchar2(10) DEFAULT NULL,\
  Div1TailNum varchar2(10) DEFAULT NULL,\
  Div2Airport varchar2(10) DEFAULT NULL,\
  Div2AirportID number DEFAULT NULL,\
  Div2AirportSeqID number DEFAULT NULL,\
  Div2WheelsOn varchar2(10) DEFAULT NULL,\
  Div2TotalGTime varchar2(10) DEFAULT NULL,\
  Div2LongestGTime varchar2(10) DEFAULT NULL,\
  Div2WheelsOff varchar2(10) DEFAULT NULL,\
  Div2TailNum varchar2(10) DEFAULT NULL,\
  Div3Airport varchar2(10) DEFAULT NULL,\
  Div3AirportID number DEFAULT NULL,\
  Div3AirportSeqID number DEFAULT NULL,\
  Div3WheelsOn varchar2(10) DEFAULT NULL,\
  Div3TotalGTime varchar2(10) DEFAULT NULL,\
  Div3LongestGTime varchar2(10) DEFAULT NULL,\
  Div3WheelsOff varchar2(10) DEFAULT NULL,\
  Div3TailNum varchar2(10) DEFAULT NULL,\
  Div4Airport varchar2(10) DEFAULT NULL,\
  Div4AirportID number DEFAULT NULL,\
  Div4AirportSeqID number DEFAULT NULL,\
  Div4WheelsOn varchar2(10) DEFAULT NULL,\
  Div4TotalGTime varchar2(10) DEFAULT NULL,\
  Div4LongestGTime varchar2(10) DEFAULT NULL,\
  Div4WheelsOff varchar2(10) DEFAULT NULL,\
  Div4TailNum varchar2(10) DEFAULT NULL,\
  Div5Airport varchar2(10) DEFAULT NULL,\
  Div5AirportID number DEFAULT NULL,\
  Div5AirportSeqID number DEFAULT NULL,\
  Div5WheelsOn varchar2(10) DEFAULT NULL,\
  Div5TotalGTime varchar2(10) DEFAULT NULL,\
  Div5LongestGTime varchar2(10) DEFAULT NULL,\
  Div5WheelsOff varchar2(10) DEFAULT NULL,\
  Div5TailNum varchar2(10) DEFAULT NULL\
) \
}