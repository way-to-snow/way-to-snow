require "open-uri"
require "nokogiri"

# method to get resort URLs
def scrape_urls(url)
  urls = []
  html_content = open(url).read
  doc = Nokogiri::HTML(html_content)

  doc.search('#resortList .panel .panel-body .h3 a').each_with_index do |element, index|
    urls << "#{element["href"]} "
    # urls << "\n"
  end
  return urls
end

# pages URLs scraped from
pages = ["https://www.skiresort.info/ski-resorts/japan/",
  "https://www.skiresort.info/ski-resorts/japan/page/2/"]

# calling scrape_urls method to output list of URLs
# pages.each do |page|
#   puts scrape_urls(page)
# end


def scrape_weather(url)
  html_content = open(url).read
  doc = Nokogiri::HTML(html_content)

  doc.search('.panel-simple table:nth-child(5) tr:nth-child(10) td:nth-child(2) strong').each_with_index do |element, index|
    puts element.text.scan(/-?\d+/).map(&:to_i)
  end
  doc.search('.panel-simple table:nth-child(5) tr:nth-child(10) td:nth-child(2) span').each_with_index do |element, index|
    puts element.text.scan(/-?\d+/).map(&:to_i)
  end
  doc.search('.panel-simple table:nth-child(11) tr:nth-child(1) td:nth-child(2) span:nth-child(3)').each_with_index do |element, index|
    puts element.text.scan(/\d+/).map(&:to_i)
  end
  doc.search('.panel-simple table:nth-child(11) tr:nth-child(1) td:nth-child(2) span:nth-child(1)').each_with_index do |element, index|
    puts element.text
  end
  doc.search('.panel-simple table:nth-child(9) tr:nth-child(3) td:nth-child(2)').each_with_index do |element, index|
    # p element
    puts element.text.scan(/\d+.*/).map(&:to_i)
  end
end

scrape_weather("https://www.skiresort.info/ski-resort/rusutsu/weather/")
