alias rdbm='echo Migrating db and prepping test db; bundle exec rake db:migrate db:test:prepare'
alias rdb='echo Dropping db, create, migrate, and test prepare;bundle exec rake db:drop db:create db:migrate db:test:prepare'
