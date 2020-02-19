desc "Importing daily weather report"
task weather: :environment do
  # All your magic here
  # Any valid Ruby code is allowed

def weather_report(resort)
  html = open("https://www.snowjapan.com/japan-ski-resorts/#{resort.url_path}").read
  doc = Nokogiri::HTML(html)
  api = open("https://api.openweathermap.org/data/2.5/forecast/daily?lat=#{resort.latitude}&lon=#{resort.longitude}&appid=#{ENV['OPENWEATHER_API_KEY']}&units=metric").read
  weather = JSON.parse(api)

  weather_report = WeatherReport.create(
    resort: resort,
    snow_depth: doc.xpath("//div[@class='current-snow-depth-box-body-data']/text()")[0].text.to_i,
    snow_change: doc.xpath("//div[@class='current-snow-depth-box-body-dif']/text()")[0].text.gsub(/[^0-9,-]/, '').to_i,
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
