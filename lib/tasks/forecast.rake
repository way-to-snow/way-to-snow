desc "Importing daily forecasts"
task forecast: :environment do
  # All your magic here
  # Any valid Ruby code is allowed

  def get_forecasts(resort)
    api_response = open("https://api.openweathermap.org/data/2.5/forecast/daily?lat=#{resort.latitude}&lon=#{resort.longitude}&appid=#{ENV['OPENWEATHER_API_KEY']}&units=metric").read
    weather = JSON.parse(api_response)

    i = 0

    4.times do
      day = weather['list'][i]
      forecast = Forecast.create(
        resort: resort,
        forecast_day: Time.at(day['dt']),
        max_temperature: day['temp']['max'],
        min_temperature: day['temp']['min'],
        wind_speed: day['speed'],
        wind_direction: deg_to_compass(day['deg']),
        weather: day['weather'][0]['description'],
        snow_amount: day['snow'].nil? ? 0 : day['snow'],
        rain: day['rain'].nil? ? 0 : day['rain']
        )
      i += 1
    end
  end

  def deg_to_compass(deg)
    val = ((deg / 22.5) + 0.5).floor
    sym = ['N', 'NNE', 'NE', 'ENE', 'E', 'ESE', 'SE', 'SSE', 'S', 'SSW', 'SW', 'WSW', 'W', 'WNW', 'NW', 'NNW']
    sym[(val % 16)]
  end

  puts "Creating forecasts"

  Resort.all.each do |resort|
    get_forecasts(resort)
  end

  puts "Finished creating forecasts"

end
#rake forecast
