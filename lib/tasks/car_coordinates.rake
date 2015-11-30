# This sets up the rake (rake get_cars) that Heroku Scheduler uses to run the Sidekiq worker (CarWorker) in the background.

desc "Gets the coordinates of cars from LunarLocator"
task :get_cars => :environment do
  puts "Getting Car Coordinates"
  	CarWorker.new.perform
  puts "done."
end