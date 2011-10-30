namespace :populate do
	desc "Populate database with locations"
	task :default_locations =>:environment do
		Location.create(:name => "Independence", :position => 0, :lat => 39.09, :lon => -94.42)
		Location.create(:name => "Kansas River", :position => 100, :lat => 39.11, :lon => -95.71)
		Location.create(:name => "Big Blue", :position => 180, :lat => 40.18, :lon => -96.67)
		Location.create(:name => "Fort Kearny", :position => 300, :lat => 40.69, :lon => -98.95)
		Location.create(:name => "Chimney Rock", :position => 550, :lat => 41.70, :lon => -103.35)
		Location.create(:name => "Fort Laramie", :position => 640, :lat => 42.21, :lon => -104.52)
		Location.create(:name => "Independence Rock", :position => 830, :lat => 42.51, :lon => -107.13)
		Location.create(:name => "South Pass", :position => 930, :lat => 42.48, :lon => -108.80)
		Location.create(:name => "Fort Bridger", :position => 1060, :lat => 42.13, :lon => -110.52)
		Location.create(:name => "Soda Springs", :position => 1220, :lat => 42.73, :lon => -111.63)
		Location.create(:name => "Fort Hall", :position => 1280, :lat => 43.04, :lon => -112.44)
		Location.create(:name => "Snake River Crossing", :position => 1460, :lat => 42.63, :lon => -114.51)
		Location.create(:name => "Fort Boise", :position => 1570, :lat => 43.61, :lon => -116.22)
		Location.create(:name => "Blue Mountains", :position => 1730, :lat => 45.50, :lon => -118.00)
		Location.create(:name => "Fort Walla Walla", :position => 1790, :lat => 46.06, :lon => -118.34)
		Location.create(:name => "Dalles", :position => 1910, :lat => 45.60, :lon => -121.18)
		Location.create(:name => "Portland", :position => 2000, :lat => 45.52, :lon => -122.67)
	end
end