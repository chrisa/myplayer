# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

feeds = Feed.create([
    { :name => 'R4 Comedy', :url => 'http://feeds.bbc.co.uk/iplayer/bbc_radio_four/comedy/list' },
    { :name => 'R4extra Comedy', :url => 'http://feeds.bbc.co.uk/iplayer/bbc_four_extra/comedy/list' },
    { :name => 'R4 Factual', :url => 'http://feeds.bbc.co.uk/iplayer/bbc_radio_four/factual/list' }
])
