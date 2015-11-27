# README

## (SPACE)CAR NEXT DOOR

Website: [cndassignment.herokuapp.com](https://cndassignment.herokuapp.com/)

Car Next Door (CND) has expanded to the Moon and I have been tasked with building an app that enables the CND staff to keep track of their lunar vehicles. 

I have used Rails as a backend to handle users and cars. The cars that were listed in CND's [LunarLocation API](cndlunarlocator.herokuapp.com/vehicles/1/locate.json) were curled into the cars_controller using [Curb](https://github.com/taf2/curb). A loop was used to iterate through each valid entry and add them my Cars table, keeping track of the columns in the API, namely the car's vehicle id, latitude and longitude. Initially, I parsed the cars into my seed file using [HTTParty](https://github.com/jnunemaker/httparty), however, this was found to be inadequate, as the cars would be constantly on the move. I also found Curb to be much faster than HTTParty in parsing the cars.

I was going to use the [Google Maps for Rails](https://github.com/apneadiving/Google-Maps-for-Rails) gem with [Geocoder](https://github.com/alexreisner/geocoder), however, I was unsure whether it would accept a customised map source, [Google Moon](https://developers.google.com/maps/documentation/javascript/examples/maptype-image). I was also concerned by the fact that they use the Earth's radius rather than the Moon's, which is significantly smaller. This would affect the location of coordinates and the distances between them. I decided to use the [Google Maps Javascript API](https://developers.google.com/maps/documentation/javascript/tutorial) documentation instead to help me set up markers, for the coordinates of users and cars, which were made available to my JS file, cndmap.js.erb, using [gon](https://github.com/gazay/gon). I converted cndmap into a js.erb file so that I could easily access the customised marker images that I obtained from [Maps Icons Collection](https://mapicons.mapsmarker.com).

I utilised the [Haversine formula](https://en.wikipedia.org/wiki/Haversine_formula) to work out the shortest distance between a signed-in user and the listed cars based on their coordinates on a spherical surface (without taking craters into consideration).

### What was used?
	* JavaScript
	* JQuery
	* Underscore.js
	* gon
	* Google Maps JavaScript API
	* HTTParty
	* Bootstrap
	* Ruby on Rails
	* RSpec
	* Factory Girl
	* Faker
	* Shoulda-Matchers
	* Curb


### Still to come

	* Gaining more expreince by using testing suites, such as RSpec, Cucumber, Capybara for Rails and Jasmine for my JavaScript files
	* Optimising the speed of my app







