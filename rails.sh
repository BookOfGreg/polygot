function rake_test_with_test_name {
  bundle exec rails test --name $1
}
function rake_test_with_file {
  # bundle exec rake TEST=$1
  bundle exec rails t $1
}
function rake_test_with_seed {
  bundle exec rails test --seed $1
}

alias rdbm='echo Migrating db and prepping test db; bundle exec rake db:migrate db:test:prepare'
alias rdb='echo Dropping db, create, migrate, and test prepare, then seed;bundle exec rake db:drop db:create db:migrate db:test:prepare; bundle exec rake db:seed'
alias rspec='bundle exec rspec'
alias rake='bundle exec rake'
# alias rails='bundle exec rails'
alias rtn=rake_test_with_test_name
alias rtf=rake_test_with_file
alias rts=rake_test_with_seed

# For ZSH compatibility
alias rs='rails s'
alias rc='rails c'
alias rg='rails g'