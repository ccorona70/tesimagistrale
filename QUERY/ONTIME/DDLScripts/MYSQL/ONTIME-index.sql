
CREATE INDEX index1 USING BTREE ON ontime( DayOfWeek, OriginState, DestState, Carrier, Year, ArrDelayMinutes );
