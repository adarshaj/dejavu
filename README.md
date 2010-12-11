facehash -- off the internet, distributed facial recognition
============================================================

facehash uses the [TeleHash][1] [DHT][2] to ditribute pictures and
match them against each other. It is ideal for use by a search and
rescue team to identify victims in a post-disaster situation.

daemon
------
The main TeleHash and HTTP daemon which broadcasts and listens to
app-specific communication.

Use TeleHash to broadcast signals and commands, HTTP to serve
the images, frontend and API.

telehash
--------
`photo` telex -- always contains url(http), and hash of the image,
optionally contains a tag (an object identifying the photo)

**signals and commands** that can be attached to a photo telex:

  * `.store` -- store a reference image, an original
  * `+match` -- a photo of a person to be ID'ed
  * `.ack` -- acknowledgement for staging of a photo for recognition
              or after storing it retry if not received within a timeout

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
      `--facehash        # executable to start the daemons
    lib/
      `--ext/            # external libraries, in 'paths'
      `--facehash/       # our libraries
      `--facehash.js     # setup
    test/                # tests

[1]: http://telehash.org/
[2]: http://en.wikipedia.org/Distributed_hash_table
