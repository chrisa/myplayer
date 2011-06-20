class Feed < ActiveRecord::Base
  
  def update_programmes
    
    feed = Feedzirra::Feed.fetch_and_parse(self.url)
    
    feed.entries.each do |entry|
      programme = Programme.find_by_feed_id(entry.id)
      if programme.nil?
        programme = Programme.create_from_feed(entry.id)
      end
    end
    
  end

end
