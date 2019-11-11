class PgQuery
  module Deparse # rubocop:disable Metrics/ModuleLength
    # Keywords that need to be escaped during deparsing. This matches they keywords
    # excaped by quote_identifier in Postgres ruleutils.c. You can refresh this
    # list using the kwlist.h file (make sure to ignore UNRESERVED_KEYWORD entries)
    KEYWORDS = %w[
      ALL
      ANALYSE
      ANALYZE
      AND
      ANY
      ARRAY
      AS
      ASC
      ASYMMETRIC
      AUTHORIZATION
      BETWEEN
      BIGINT
      BINARY
      BIT
      BOOLEAN
      BOTH
      CASE
      CAST
      CHAR
      CHARACTER
      CHECK
      COALESCE
      COLLATE
      COLLATION
      COLUMN
      CONCURRENTLY
      CONSTRAINT
      CREATE
      CROSS
      CURRENT_CATALOG
      CURRENT_DATE
      CURRENT_ROLE
      CURRENT_SCHEMA
      CURRENT_TIME
      CURRENT_TIMESTAMP
      CURRENT_USER
      DEC
      DECIMAL
      DEFAULT
      DEFERRABLE
      DESC
      DISTINCT
      DO
      ELSE
      END
      EXCEPT
      EXISTS
      EXTRACT
      FALSE
      FETCH
      FLOAT
      FOR
      FOREIGN
      FREEZE
      FROM
      FULL
      GRANT
      GREATEST
      GROUP
      GROUPING
      HAVING
      ILIKE
      IN
      INITIALLY
      INNER
      INOUT
      INT
      INTEGER
      INTERSECT
      INTERVAL
      INTO
      IS
      ISNULL
      JOIN
      LATERAL
      LEADING
      LEAST
      LEFT
      LIKE
      LIMIT
      LOCALTIME
      LOCALTIMESTAMP
      NATIONAL
      NATURAL
      NCHAR
      NONE
      NOT
      NOTNULL
      NULL
      NULLIF
      NUMERIC
      OFFSET
      ON
      ONLY
      OR
      ORDER
      OUT
      OUTER
      OVERLAPS
      OVERLAY
      PLACING
      POSITION
      PRECISION
      PRIMARY
      REAL
      REFERENCES
      RETURNING
      RIGHT
      ROW
      SELECT
      SESSION_USER
      SETOF
      SIMILAR
      SMALLINT
      SOME
      SUBSTRING
      SYMMETRIC
      TABLE
      TABLESAMPLE
      THEN
      TIME
      TIMESTAMP
      TO
      TRAILING
      TREAT
      TRIM
      TRUE
      UNION
      UNIQUE
      USER
      USING
      VALUES
      VARCHAR
      VARIADIC
      VERBOSE
      WHEN
      WHERE
      WINDOW
      WITH
      XMLATTRIBUTES
      XMLCONCAT
      XMLELEMENT
      XMLEXISTS
      XMLFOREST
      XMLNAMESPACES
      XMLPARSE
      XMLPI
      XMLROOT
      XMLSERIALIZE
      XMLTABLE
    ].freeze
  end
end
