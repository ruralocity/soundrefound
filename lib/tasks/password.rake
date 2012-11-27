namespace :password do
  desc "reset a user's password"
  task :reset => :environment do
    raise "Usage: USER and PASSWORD required e.g. 'USER=user@example.com PASSWORD=newpassword'" if ENV["USER"].blank? or ENV["PASSWORD"].blank?
    if user = User.where(email: ENV["USER"]).first
      user.update_attributes({password: ENV["PASSWORD"], password_confirmation: ENV["PASSWORD"]})
      puts "Successfully updated password."
    else
      puts "Unable to find user #{ENV["USER"]}"
    end
  end
end