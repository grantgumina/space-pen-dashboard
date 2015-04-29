require 'sinatra'


get '/' do 

	@data = []

	File.open("test") do |file|
		file.each_line do |line|

			x = line.split(",")[0]
			y = line.split(",")[1]
			z = line.split(",")[2]
			num_objects = line.split(",")[3]
			button_on = line.split(",")[4].strip!

			array = [x, y, z, num_objects, button_on]
			@data.push(array)
		end
	end

	@btn_on = @data[-1][4]

	@total_objects = 0
  	@data.each do |d| 
 		@total_objects += d[3].to_i
 	end

	@index_active = "active"
	@settings_active = ""
	erb :index
end

get '/settings' do
	@index_active = ""
	@settings_active = "active"
	erb :settings
end