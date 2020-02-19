require 'time'
require 'open-uri'
require 'nokogiri'
require 'json'
require 'csv'
require 'smarter_csv'

puts 'Creating resorts with basic info...'

resorts = SmarterCSV.process('db/resorts.csv')
resorts.each do |resort|
  Resort.create(
    name: resort[:resort_name],
    town: resort[:town],
    prefecture: resort[:prefecture],
    latitude: resort[:latitude],
    longitude: resort[:longitude],
    url_path: resort[:url_path],
    name_ja: resort[:name_ja],
    address_ja: resort[:address_ja]
  )
end

puts 'Finished creating resorts with basic info...'

def more_details(resort)
  html = open("https://www.snowjapan.com/japan-ski-resorts/#{resort.url_path}").read
  doc = Nokogiri::HTML(html)

  resort.url = doc.css('div#information a').map { |link| link['href'] }[0]
  resort.advanced = doc.css('div.percent1').text.to_i
  resort.intermediate = doc.css('div.percent2').text.to_i
  resort.beginner = doc.css('div.percent3').text.to_i
  resort.percent_snowboards = doc.css('td.ski-snowbard').map { |each| each.text }[1].gsub(/[^0-9]/, '').to_i
  resort.phone_number = doc.css('table#more-info td').map { |each| each.text }[-1]
  resort.adult_price = doc.css('table.lift-ticket-charges td').map { |each| each.text }[1].gsub(/[^0-9]/, '').to_i
  resort.child_price = doc.css('table.lift-ticket-charges td').map { |each| each.text }[3].gsub(/[^0-9]/, '').to_i
  resort.season_planned = doc.css('div.season-planned').map { |each| each.text }[0].gsub(/\s+/, " ").strip
  resort.top_elevation = doc.css('td.mountain-data-holder td').map { |each| each.text }[0].split(' ')[0].gsub(/[^0-9]/, '').to_i
  resort.bottom_elevation = doc.css('td.mountain-data-holder td').map { |each| each.text }[0].split(' ')[2].gsub(/[^0-9]/, '').to_i
  resort.courses = doc.css('td.mountain-data-holder td').map { |each| each.text }[1].split(' ')[1].gsub(/[^0-9]/, '').to_i
  resort.longest_course = doc.css('td.mountain-data-holder td').map { |each| each.text }[1].split(' ')[2].gsub(/[^0-9]/, '').to_i
  resort.lifts = doc.css('tr#lift-number-row td').map { |each| each.text }.join.split(' ').map { |num| num.to_i }.sum
  resort.ski_school = (doc.css('div#facilities tr').map { |each| each.text }[1].split(' ')[3] == 'Available')
  resort.sb_school = (doc.css('div#facilities tr').map { |each| each.text }[1].split(' ')[6] == 'Available')
  resort.child_care = not(doc.css('div#facilities tr').map { |each| each.text }[9].split(' ').join.include?('nospecialfacilities'))
end

Resort.all.each do |resort|
  puts "Scraping additional info for #{resort.name}"
  more_details(resort)
  resort.save
end

puts 'Finished seeding resorts...'
