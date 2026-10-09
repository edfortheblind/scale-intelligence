create function TimeOnly(@DateTime DateTime)
-- returns only the time portion of a DateTime, at the "base" date (1/1/1900)
-- Thanks, Peso!
returns datetime
as
    begin
    return dateadd(day, -datediff(day, 0, @datetime), @datetime)
    end