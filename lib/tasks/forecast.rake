# desc "Importing daily forecasts"
task forecast: :environment do
  # All your magic here
  # Any valid Ruby code is allowed

  def get_forecasts(resort)
    api_response = open("https://api.openweathermap.org/data/2.5/forecast/daily?lat=#{resort.latitude}&lon=#{resort.longitude}&appid=#{ENV['OPENWEATHER_API_KEY']}&units=metric").read
    weather = JSON.parse(api_response)

    (0..3).map do |i|
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
    end
  end

  def deg_to_compass(deg)
    val = ((deg / 22.5) + 0.5).floor
    sym = ['N', 'NNE', 'NE', 'ENE', 'E', 'ESE', 'SE', 'SSE', 'S', 'SSW', 'SW', 'WSW', 'W', 'WNW', 'NW', 'NNW']
    sym[(val % 16)]
  end

  puts "Destroying old forecasts"

  Forecast.destroy_all

  Resort.all.each do |resort|
    puts "Creating four day forecasts for #{resort.name}"
    forecasts = get_forecasts(resort)
    snow_depth = resort.weather_reports.last.snow_depth

    forecasts.each do |forecast|
      if forecast.wind_speed > 45 || forecast.rain.positive? || snow_depth < 49
        forecast.condition = "bad"
      elsif forecast.snow_amount.ceil > 10
        forecast.condition = "great"
      elsif (1..10).include?(forecast.snow_amount.ceil)
        forecast.condition = "good"
      else
        forecast.condition = "average"
      end
      forecast.save
    end
  end
  puts "Finished creating forecasts"

end
#rake forecast

      # elsif forecast.snow_amount.round.zero? && (50..99).include?(snow_depth)
      #   forecast.condition = "average"
      # elsif (1..10).include?(forecast.snow_amount.ceil) && (50..99).include?(snow_depth)
      #   forecast.condition = "good"
      # else
      #   forecast.condition = "great"

