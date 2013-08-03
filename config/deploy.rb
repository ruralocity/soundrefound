require "bundler/capistrano"
require "rvm/capistrano"
require 'secret_token_replacer/recipes'

set :application, "soundrefound"
set :repository,  "https://github.com/ruralocity/soundrefound.git"

set :rvm_ruby_string, '1.9.3-p448'
set :rvm_type, :system

set :deploy_to,   "/var/www/#{application}"
set :user, 'deploy'
set :use_sudo, false

set :scm, :git

role :web, "tigerbomb.ruralocity.com"
role :app, "tigerbomb.ruralocity.com"
role :db,  "tigerbomb.ruralocity.com", :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end