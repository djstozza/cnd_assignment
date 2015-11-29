desc "Gets the coordinates of cars from LunarLocator"
task :get_cars => :environment do
  puts "Getting Car Coordinates"
  	CarWorker.new.perform
  puts "done."
end