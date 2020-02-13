require "open-uri"
require "nokogiri"

# method to scrape resort URLs
def scrape_urls(url)
  urls = []
  html_content = open(url).read
  doc = Nokogiri::HTML(html_content)

  doc.search('#resortList .panel .panel-body .h3 a').each_with_index do |element, index|
    urls << "#{element["href"]} "
  end
  return urls
end

#pages used for URL information
pages = ["https://www.skiresort.info/ski-resorts/japan/sorted/number-lifts/",
  "https://www.skiresort.info/ski-resorts/japan/page/2/sorted/number-lifts/"]
