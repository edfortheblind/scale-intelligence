-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create function TimeOnly(@DateTime DateTime)
-- [comment omitted]
-- [comment omitted]
returns datetime
as
    begin
    return dateadd(day, -datediff(day, 0, @datetime), @datetime)
    end