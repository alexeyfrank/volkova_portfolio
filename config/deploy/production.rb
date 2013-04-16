set :rails_env, "production"
set :branch, 'master'
set :user, 'volkova_portfolio_production'
set :keep_releases, 5

role :web, '62.76.184.163'
role :app, '62.76.184.163'
role :db,  '62.76.184.163', :primary => true