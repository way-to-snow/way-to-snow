desc "Importing daily weather report"
task weather: :environment do
  # All your magic here
  # Any valid Ruby code is allowed

def weather_report(resort)
  html = open("https://www.snowjapan.com/japan-ski-resorts/#{resort.url_path}/snowfall").read
  doc = Nokogiri::HTML(html)
  api = open("https://api.openweathermap.org/data/2.5/forecast/daily?lat=#{resort.latitude}&lon=#{resort.longitude}&appid=#{ENV['OPENWEATHER_API_KEY']}&units=metric").read
  weather = JSON.parse(api)
  snow = doc.css('div.resort-option-box-main td')[1].text.split(' ')
  snow.count == 7 && snow[0] != '---' ? depth = snow[0].gsub(/[^0-9,-]/, '').to_i : depth = nil
  snow.count == 7 && snow[0] != '---' ? change = snow[1].gsub(/[^0-9,-]/, '').to_i : change = nil

  weather_report = WeatherReport.create(
    resort: resort,
    snow_depth: depth,
    snow_change: change,
    date: Time.at(weather['list'][0]['dt']),
    report: weather
  )
end

puts "Fetching weather reports"

Resort.all.each do |resort|
  puts "Getting weather report for #{resort.name}"
  weather_report(resort)
end

puts "Finished fetching weather reports"

end
#rake weather
