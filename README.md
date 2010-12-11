dejavu -- distributed image recognition
=======================================

dejavu uses the [TeleHash][1] [DHT][2] to ditribute pictures and
match them against each other.

One use case would be for a search and rescue team to identify victims
in a post-disaster situation. Given each member of the team has a part
of the database of faces such that the entire network contains the whole
database, a face can be effeciently recognized by distributing a
picture among the peers.

daemon
------
The TeleHash and HTTP daemon which broadcasts and listens to
app-specific communication.

Use TeleHash to broadcast signals and commands, HTTP to serve
the images, frontend and API.

telehash
--------
`photo` telex -- always contains url(http), and hash of the image,
optionally contains a tag (an object identifying the photo)

**signals and commands** that can be attached a photo telex to:

 * `.store` -- store a reference image, an original
 * `+match` -- a photo of a person to be ID'ed
 * `.ack` -- acknowledgement for staging of a photo for recognition
   or after storing it retry if not received within a timeout

when the daemon is started with the `--seed` option, it skips bootstrap. It's
world-facing IP has to be manually determined and distributed to the new coming
peers.

web interface
-------------
Easy web based interface that allows for drag-drop input, shows percentage
similarity, allows humans to attest results. Preferably implemented in pure
node.js.

api
---
Simple RESTful HTTP API for mobile apps to use.

files
-----

    bin/
      `--dejavu        # executable to start the daemons
    lib/
      `--ext/          # external libraries, in 'paths'
      `--dejavu/       # our libraries
      `--dejavu.js     # setup
    test/              # tests

[1]: http://telehash.org/
[2]: http://en.wikipedia.org/wiki/Distributed_hash_table
