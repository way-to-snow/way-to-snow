# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
require "nokogiri"

def scrape_urls(url)
  # TODO: return an array of Antiques found of Craigslist for this `city`.
  urls = []
  html_content = open(url).read
  doc = Nokogiri::HTML(html_content)

  doc.search('#resortList .panel .panel-body .h3 a').each_with_index do |element, index|
    urls << "#{element["href"]} "
    # urls << "\n"
  end
  return urls
end


pages = ["https://www.skiresort.info/ski-resorts/japan/sorted/number-lifts/",
  "https://www.skiresort.info/ski-resorts/japan/page/2/sorted/number-lifts/"
]

pages.each do |page|
  puts scrape_urls(page)
end
