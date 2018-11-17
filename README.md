# README

# local

rake db:drop
rake db:setup

# production

heroku pg:reset --confirm teacher-test
heroku rake db:schema:load
heroku rake db:migrate
heroku rake db:seed
# Data-table
