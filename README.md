Myplayer
========

This is a simple front-end to the BBC's iPlayer streams for iOS
devices.

Using the syndication feeds for iPlayer programmes, it creates pages
for Mobile Safari containing audio players initialised to the
appropriate stream URLs.

Limitations
-----------

Note that this will still only work for iOS devices - there's nothing
here that allows the streams to be played on any other type of device.

There's also nothing here that allows recording of streams or playing
of streams beyond their expiry date - the audio is still served by the
BBC, isn't proxied by this system, and is still subject to their
content protection systems.

Implementation
--------------

The implementation is simply to get the "version pid" for the
programme from its playlist entry, and then generate a page with this
kind of <audio> tag:

    <audio controls src="https://securegate.iplayer.bbc.co.uk/mediaselector/5/redir/vpid/VERSION_PID/media/iplayer_stb_uk_stream_aac_concrete/proto/https"></audio>

There's no "screen-scraping" of HTML done here: the following type of
URLs are requested:

    http://feeds.bbc.co.uk/iplayer/bbc_four_extra/comedy/list
    http://feeds.bbc.co.uk/iplayer/episode/b0129bpk
    http://www.bbc.co.uk/iplayer/playlist/b0129bpk

all of which return XML, either Atom or the BBC's "Playlist" format. 
  
Motivation
----------

The mobile iPlayer website currently doesn't work on iOS 3.1.3, which
is the last version you want to run on an iPhone 3G, and the iPlayer
app requires at least iOS 4.3.x, which isn't available for the iPhone
3G at all.

The actual audio streams still work though, hence this app.
