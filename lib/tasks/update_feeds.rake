task "myplayer:update_feeds" => :environment do
  Feed.find(:all).each do |f|
    f.update_programmes
  end
end

