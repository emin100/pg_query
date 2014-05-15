pg_query
========

This Ruby extension uses the actual PostgreSQL server source to parse SQL queries and return the internal PostgreSQL parsetree.

In addition the extension allows you to normalize queries (replacing constant values with ?) and parse these normalized queries into a parsetree again.

When you build this extension, it fetches a copy of the PostgreSQL server source and builds it, and then statically links it into this extension.

This is slightly crazy, but is the only reliable way of parsing all valid PostgreSQL queries.

**Note:** This gem uses a [patched version of the latest PostgreSQL stable](https://github.com/pganalyze/postgres/compare/REL9_3_STABLE...pg_query).

Installation
------------

```
gem install pg_query
```

Due to compiling PostgreSQL, installation will take a while. Expect up to 10 minutes on a fast machine.

Usage
-----

```ruby
PgQuery.parse("SELECT 1")

=> #<PgQuery:0x007fe92b27ea18
 @parsetree=
  [{"SELECT"=>
     {"distinctClause"=>nil,
      "intoClause"=>nil,
      "targetList"=>
       [{"RESTARGET"=>
          {"name"=>nil,
           "indirection"=>nil,
           "val"=>{"A_CONST"=>{"val"=>1, "location"=>7}},
           "location"=>7}}],
      ...}}],
 @query="SELECT 1",
 @warnings=[]>

# Normalizing a query (like pg_stat_statements)
PgQuery.normalize("SELECT 1 FROM x WHERE y = 'foo'")

=> "SELECT ? FROM x WHERE y = ?"

# Parsing a normalized query
PgQuery.parse("SELECT ? FROM x WHERE y = ?")

=> #<PgQuery:0x007fb99455a438
 @parsetree=
  [{"SELECT"=>
     {"distinctClause"=>nil,
      "intoClause"=>nil,
      "targetList"=>
       [{"RESTARGET"=>
          {"name"=>nil,
           "indirection"=>nil,
           "val"=>{"PARAMREF"=>{"number"=>0, "location"=>7}},
           "location"=>7}}],
      "fromClause"=>
       [{"RANGEVAR"=>
          {"schemaname"=>nil,
           "relname"=>"x",
           "inhOpt"=>2,
           "relpersistence"=>"p",
           "alias"=>nil,
           "location"=>14}}],
      "whereClause"=>
       {"AEXPR"=>
         {"name"=>["="],
          "lexpr"=>{"COLUMNREF"=>{"fields"=>["y"], "location"=>22}},
          "rexpr"=>{"PARAMREF"=>{"number"=>0, "location"=>26}},
          "location"=>24}},
      ...}}],
 @query="SELECT ? FROM x WHERE y = ?",
 @warnings=[]>
```

Authors
-------

- [Lukas Fittl](mailto:lukas@fittl.com)

License
-------

Copyright (c) 2014, pganalyze Team <team@pganalyze.com><br>
pg_query is licensed under the 3-clause BSD license, see LICENSE file for details.

Query normalization code:<br>
Copyright (c) 2008-2014, PostgreSQL Global Development Group
