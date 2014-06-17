alias rdbm='echo Migrating db and prepping test db; bundle exec rake db:migrate db:test:prepare'
alias rdb='echo Dropping db, create, migrate, and test prepare, then seed;bundle exec rake db:drop db:create db:migrate db:test:prepare; bundle exec rake db:seed'
alias rspec='bundle exec rspec'
alias rake='bundle exec rake'
