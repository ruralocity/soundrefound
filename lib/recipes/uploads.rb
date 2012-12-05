namespace :carrierwave do
  desc 'Create symlink to uploaded files'
  task :symlink do
    run "ln -nfs #{shared_path}/public/uploads #{release_path}/public/uploads"
  end
end

after "deploy:update_code", "carrierwave:symlink"
