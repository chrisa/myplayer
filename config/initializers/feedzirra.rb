# extra parsing for the iplayer Atom feeds.

Feedzirra::Feed.add_common_feed_entry_element('dcterms:valid', :as => :valid)
Feedzirra::Feed.add_common_feed_entry_element('media:thumbnail', :value => :url, :as => :thumbnail)

