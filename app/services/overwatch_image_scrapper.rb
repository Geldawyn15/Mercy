require 'open-uri'
require 'nokogiri'

class OverwatchImageScrapper
  def scrapping
    heronames = {}
    url = "https://overwatch.gamepedia.com/Heroes"
    doc = Nokogiri::HTML(open(url))
    doc.search('table:first-of-type td img').each do |img|
      heronames[img.parent.attr('title')] = img.attr('src')
    end
    heronames
  end
end
