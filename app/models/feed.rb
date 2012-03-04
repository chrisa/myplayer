class Feed < ActiveRecord::Base
  has_many :programmes

  def update_programmes
    feed = Feedzirra::Feed.fetch_and_parse(self.url)
    feed.entries.each do |entry|
      programme = programmes.find_by_uri(entry.id)
      if programme.nil?
        programme = Programme.create_from_feed(self, entry)
      end
    end
  end

end
