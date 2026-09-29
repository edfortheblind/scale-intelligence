-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








CREATE procedure sp_generate_insert_script
                 @tablename_mask nvarchar(30) = NULL
as
begin
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]

-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]

  declare @tablename       nvarchar (128)
  declare @tablename_max   nvarchar (128)
  declare @tableid         int
  declare @columncount     numeric (7,0)
  declare @columncount_max numeric (7,0)
  declare @columnname      nvarchar (30)
  declare @columntype      int
  declare @string          nvarchar (30)
  declare @leftpart        nvarchar (4000)    /* [comment omitted] */
  declare @rightpart       nvarchar (4000)    /* [comment omitted] */
  declare @hasident        int

  set nocount on

  -- [comment omitted]
  if (@tablename_mask is NULL)
  begin
    select @tablename_mask = N'<literal:1>'
  end

  -- [comment omitted]

  create table #columninfo
  (num      numeric (7,0) identity,
   name     nvarchar(30),
   usertype smallint)


  select name,
         id
    into #tablenames
    from sysobjects
   where type in (N'<literal:2>' ,N'<literal:3>')
     and name like @tablename_mask

  -- [comment omitted]

  select @tablename_max  = MAX (name),
         @tablename      = MIN (name)
    from #tablenames

  while @tablename <= @tablename_max
  begin
    select @tableid   = id
      from #tablenames
     where name = @tablename

    if (@@rowcount <> 0)
    begin
      -- [comment omitted]
      select @hasident = max( status & 0x80 )
        from syscolumns
       where id = @tableid

      truncate table #columninfo

      insert into #columninfo (name,usertype)
      select name, type
        from syscolumns C
       where id = @tableid
         and type <> 37            -- [comment omitted]

      -- [comment omitted]

      select @leftpart = N'<literal:4>'+@tablename
      select @leftpart = @leftpart + N'<literal:5>'

      select @columncount     = MIN (num),
             @columncount_max = MAX (num)
        from #columninfo
      while @columncount <= @columncount_max
      begin
        select @columnname = name,
               @columntype = usertype
          from #columninfo
         where num = @columncount
        if (@@rowcount <> 0)
        begin
          if (@columncount < @columncount_max)
          begin
            select @leftpart = @leftpart + @columnname + N'<literal:6>'
          end
          else
          begin
            select @leftpart = @leftpart + @columnname + N'<literal:7>'
          end
        end

        select @columncount = @columncount + 1
      end

      select @leftpart = @leftpart + N'<literal:8>'

      -- [comment omitted]

      select @columncount     = MIN (num),
             @columncount_max = MAX (num)
        from #columninfo

      select @rightpart = N'<literal:9>'

      while @columncount <= @columncount_max
      begin
        select @columnname = name,
               @columntype = usertype
          from #columninfo
         where num = @columncount

        if (@@rowcount <> 0)
        begin

          if @columntype in (39,47) /* [comment omitted] */


          begin
            select @rightpart = @rightpart + N'<literal:10>'
            select @rightpart = @rightpart + N'<literal:11>' + replicate( nchar(39), 4 ) + N'<literal:12>' + @columnname + N'<literal:13>' + replicate( nchar(39), 4 ) + N'<literal:14>' + replicate( nchar(39), 6) + N'<literal:15>' + replicate( nchar(39), 4 ) + N'<literal:16>'
          end

          else if @columntype = 35 /* [comment omitted] */
                                   /* [comment omitted] */
          begin
            select @rightpart = @rightpart + N'<literal:17>'
            select @rightpart = @rightpart + N'<literal:18>' + replicate( nchar(39), 4 ) + N'<literal:19>' + @columnname + N'<literal:20>' + N'<literal:21>' + replicate( nchar(39), 4 ) + N'<literal:22>' + replicate( nchar(39), 6 ) + N'<literal:23>' + replicate( nchar(39), 4 ) + N'<literal:24>'
          end

          else if @columntype in (58,61,111) /* [comment omitted] */
          begin
            select @rightpart = @rightpart + N'<literal:25>'
            select @rightpart = @rightpart + N'<literal:26>' + replicate( nchar(39), 4 ) + N'<literal:27>' + @columnname + N'<literal:28>'+ replicate( nchar(39), 4 ) + N'<literal:29>'
          end

          else   /* [comment omitted] */
          begin
            select @rightpart = @rightpart + N'<literal:30>'
            select @rightpart = @rightpart + N'<literal:31>' + @columnname + N'<literal:32>'
          end


          if ( @columncount < @columncount_max)
          begin
            select @rightpart = @rightpart + N'<literal:33>'
          end

        end
        select @columncount = @columncount + 1
      end

    end

    select @rightpart = @rightpart + N'<literal:34>' + N'<literal:35>' + @tablename

    -- [comment omitted]
    -- [comment omitted]
    select @rightpart = @rightpart + N'<literal:36>'

    -- [comment omitted]
    -- [comment omitted]

    if @hasident > 0
       select N'<literal:37>' + @tablename + N'<literal:38>'

    exec ( @leftpart + @rightpart )

    if @hasident > 0
       select N'<literal:39>' + @tablename + N'<literal:40>'

    select @tablename      = MIN (name)
      from #tablenames
     where name            > @tablename
  end

end


-- [comment omitted]