$LOAD_PATH.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'pg_query_pg_ddm'
  s.version     = 0.2

  s.summary     = 'PostgreSQL query parsing and normalization library'
  s.description = 'Parses SQL queries using a copy of the PostgreSQL server query parser(This is a fork of https://github.com/lfittl/pg_query. ) This repo includes extra deparser improvements.'
  s.author      = 'Mehmet Emin KARAKAŞ'
  s.email       = 'emin100@gmail.com'
  s.license     = 'BSD-3-Clause'
  s.homepage    = 'http://github.com/emin100/pg_query/tree/my_master'
  s.metadata    = { "source_code_uri" => "http://github.com/emin100/pg_query/tree/my_master" }


  s.extensions = %w[ext/pg_query/extconf.rb]

  s.files = Dir['CHANGELOG.md', 'LICENSE', 'README.md', 'Rakefile', 'lib/**/*.rb',
                'ext/pg_query/*.{c,h,sym,rb}', 'ext/pg_query/patches/*']

  # Don't unnecessarily include the Postgres source in rdoc (sloooow!)
  s.rdoc_options     = %w[--main README.md --exclude ext/]
  s.extra_rdoc_files = %w[CHANGELOG.md README.md]

  s.add_development_dependency 'rake-compiler', '~> 0'
  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'rubocop', '0.49.1'
  s.add_development_dependency 'rubocop-rspec', '1.15.1'
end
