namespace :db do
  desc "Create database.yml in shared path"
  task :configure do
    set :database_name do
      Capistrano::CLI.ui.ask "Database Name: "
    end
    set :database_username do
      Capistrano::CLI.ui.ask "Database Username: "
    end
    set :database_password do
      Capistrano::CLI.ui.ask "Database Password: "
    end

    db_config = <<-EOF
production:
  database: #{database_name}
  adapter: mysql2
  encoding: utf8
  username: #{database_username}
  password: #{database_password}
  socket: /var/run/mysqld/mysqld.sock
    EOF

    run "mkdir -p #{shared_path}/config"
    put db_config, "#{shared_path}/config/database.yml"
  end

  desc "Make symlink for database.yml in current release"
  task :symlink do
    run "ln -nfs #{shared_path}/config/database.yml #{latest_release}/config/database.yml"
  end

  desc "populate the database from db/seeds.rb"
  task :seed do
    run "cd #{deploy_to}/current && RAILS_ENV=production bundle exec rake db:seed"
  end

  desc "show migration status"
  task :status do
    run "cd #{deploy_to}/current && RAILS_ENV=production bundle exec rake db:migrate:status"
  end
end

after "deploy:update_code", "db:symlink"
