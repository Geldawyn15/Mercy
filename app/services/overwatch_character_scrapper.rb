require 'open-uri'
require 'nokogiri'

class OverwatchCharacterScrapper
  def scrapping2
    ow_roles = %w[Bastion DVa Genji Hanzo Junkrat Lucio McCree Mei Mercy Pharah Reaper Reinhardt Roadhog Soldier-76 Symmetra Torbjörn Tracer Widowmaker Winston Zarya Zenyatta]
    heronames = {}
    url = "https://www.polygon.com/2016/5/23/11744852/overwatch-character-guide"
    doc = Nokogiri::HTML(open(url))
    doc.search('h3 + img').each do |element|
      image_url = element.attr('src')
      image_url.gsub!(/https:\/\/cdn\d.vox-cdn.com\/uploads\/chorus_asset\/file\/\d*\//, '')
      image_url.gsub!(/_select.0.jpg$/, '')
      heronames[image_url.downcase] = element.attr('src')
      heronames['soldier76'] = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTPIsF0RSS_a5lYpdaLtjhna2CNK0_kiTH_xHbqG7um5ek5NwReQ'
    end
    heronames
  end
end

ov = OverwatchCharacterScrapper.new
p ov.scrapping2
