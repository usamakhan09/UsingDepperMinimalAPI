﻿if not exists (select 1 from dbo.[User])
begin
	insert into dbo.[User] (FirstName,LastName)
	values ('usama','khan'),
	('areez','arsalan'),
	('Tim','paul'),
	('john','smith');	
end