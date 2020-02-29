# desc "Importing daily forecasts"
task forecast: :environment do
  # All your magic here
  # Any valid Ruby code is allowed

  def get_forecasts(resort)
    api_response = open("https://api.openweathermap.org/data/2.5/forecast/daily?lat=#{resort.latitude}&lon=#{resort.longitude}&appid=#{ENV['OPENWEATHER_API_KEY']}&units=metric").read
    weather = JSON.parse(api_response)

    i = 0

    4.times do
      day = weather['list'][i]
      Forecast.create(
        resort: resort,
        forecast_day: Time.at(day['dt']),
        max_temperature: day['temp']['max'],
        min_temperature: day['temp']['min'],
        wind_speed: day['speed'],
        wind_direction: deg_to_compass(day['deg']),
        weather: day['weather'][0]['description'],
        snow_amount: day['snow'].nil? ? 0 : day['snow'],
        rain: day['rain'].nil? ? 0 : day['rain'],
        condition: ""
      )
      i += 1
    end
  end

  def deg_to_compass(deg)
    val = ((deg / 22.5) + 0.5).floor
    sym = ['N', 'NNE', 'NE', 'ENE', 'E', 'ESE', 'SE', 'SSE', 'S', 'SSW', 'SW', 'WSW', 'W', 'WNW', 'NW', 'NNW']
    sym[(val % 16)]
  end

  Resort.all.each do |resort|
    puts "Creating four day forecasts for #{resort.name}"
    get_forecasts(resort)
  end

  Forecast.all.each do |forecast|
    if forecast.wind_speed > 45 || forecast.rain.positive?
      forecast.condition = "bad"
    elsif forecast.snow_amount.round.zero?
      forecast.condition = "average"
    elsif forecast.snow_amount.positive? && forecast.snow_amount.round < 10
      forecast.condition = "good"
    else
      forecast.condition = "great"
    end
    forecast.save
  end

  puts "Finished creating forecasts"

end
#rake forecast
