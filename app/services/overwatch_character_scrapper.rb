class OverwatchCharacterScrapper
  def scrapping2
    ow_roles = %w[Bastion DVa Genji Hanzo Junkrat Lucio McCree Mei Mercy Pharah Reaper Reinhardt Roadhog Soldier-76 Symmetra Torbjörn Tracer Widowmaker Winston Zarya Zenyatta]
    heronames = {}
    ow_roles.each_with_index do |name, i|
      url = "https://cdn0.vox-cdn.com/uploads/chorus_asset/file/6531029/#{ow_roles[i]}_select.0.jpg"
      heronames[ow_roles[i]] = url
    end
    heronames
  end
end
