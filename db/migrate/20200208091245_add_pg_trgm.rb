class AddPgTrgm < ActiveRecord::Migration[6.0]
  def up
    execute 'CREATE EXTENSION IF NOT EXISTS pg_trgm;'
    execute 'CREATE EXTENSION IF NOT EXISTS unaccent;'
    execute 'CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;'
    execute <<-SQL
      CREATE OR REPLACE FUNCTION f_unaccent(text)
      RETURNS text AS
      $func$
      SELECT public.unaccent('public.unaccent', $1) -- schema-qualify function and dictionary
      $func$
      LANGUAGE sql
      IMMUTABLE;
    SQL
  end

  def down
    execute 'DROP EXTENSION IF EXISTS pg_trgm;'
    execute 'DROP EXTENSION IF EXISTS unaccent;'
    execute 'DROP EXTENSION IF EXISTS fuzzystrmatch;'
  end
end
