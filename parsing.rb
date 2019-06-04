require 'nokogiri'
require 'open-uri'
require 'pry'

url = "https://overwatch.gamepedia.com/Heroes"

doc = Nokogiri::HTML(open(url))
binding.pry
doc.search('table:first-of-type td img').each do |img|
  img.attr('src')
end
