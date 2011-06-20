require 'hashie/mash'

class Programme < ActiveRecord::Base
  
  PLAYLIST_BASE = 'http://www.bbc.co.uk/iplayer/playlist/'

  class << self

    def create_from_feed(feed_id)
      ep_pid = ''
      /tag:feeds.bbc.co.uk,2008:PIPS:([a-z0-9]+)$/.match(feed_id) do |m|
        ep_pid = m[1]
      end

      if (ep_pid.empty?)
        raise "no ep_pid from: " + feed_id
      end

      connection = Faraday.new(:url => PLAYLIST_BASE) do |builder|
        builder.adapter Faraday.default_adapter
        builder.use Faraday::Response::ParseXml
      end

      res = connection.get(ep_pid)

      playlist = res.body['playlist']
      title = playlist['title']
      summary = playlist['summary']
      
      item = playlist['item']
      broadcast = item['broadcast']
      channel = item['service']
      ver_pid = item['mediator']['identifier']

      Programme.create(
        :title     => title,
        :ep_pid    => ep_pid,
        :feed_id   => feed_id,
        :ver_pid   => ver_pid,
        :summary   => summary,
        :channel   => channel,
        :broadcast => broadcast,
      )
    end

  end

end
