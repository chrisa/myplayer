class Programme < ActiveRecord::Base
  belongs_to :feed

  PLAYLIST_BASE = 'http://www.bbc.co.uk/iplayer/playlist/'

  default_scope lambda {
    where(self.arel_table[:expires].gteq(Time.now.utc)).order('broadcast DESC')
  }

  class << self

    def create_from_feed(feed, entry)

      # use entry

      thumbnail = entry.thumbnail

      # retrieve full atom entry to get dcterms:valid

      full_entry = Feedzirra::Feed.fetch_and_parse(entry.links[1]).entries[0]
      unless full_entry.valid.nil?
        valid = full_entry.valid.gsub(/\n\s+/, '').split(/;/)
        h = Hash.new
        valid.each { |v|
          kv = v.split(/=/)
          h[kv[0]] = kv[1]
        }
        expires = h['end']
      end

      # retrieve playlist

      uri = entry.id
      ep_pid = ''
      m = /tag:feeds.bbc.co.uk,2008:PIPS:([0-9a-z]+)$/.match(uri)
      if m
        ep_pid = m[1]
      end

      if (ep_pid.empty?)
        raise "no ep_pid from: " + uri
      end

      connection = Faraday.new(:url => PLAYLIST_BASE) do |builder|
        builder.adapter Faraday.default_adapter
        builder.use Faraday::Response::ParseXml
      end

      res = connection.get(ep_pid)

      playlist = res.body['playlist']
      title = playlist['title']
      summary = playlist['summary']

      return if playlist['noItems']

      item = playlist['item']
      broadcast = item['broadcast']
      channel = item['service']
      duration = item['duration']
      ver_pid = item['mediator']['identifier']

      puts "Creating #{title}"

      Programme.create(
        :feed_id   => feed.id,

        :uri       => uri,
        :title     => title,
        :ep_pid    => ep_pid,
        :ver_pid   => ver_pid,
        :summary   => summary,
        :channel   => channel,
        :broadcast => broadcast,
        :duration  => duration,
        :expires   => expires,
        :image_url => thumbnail
      )
    end

  end

end
