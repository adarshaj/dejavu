# telehash Module

# Some generally usefuls.

## keys(o)

Enumerate data fields of an object.
Function objects are skipped.

## time()

See time(2).

## rand(n)

Return a random integer 1..n inclusive.

## isArray(o)

return ( Math.floor ( Math.random ( time() ) * n + 1 ) );
Test if an Object is an Array.

## isString(o)

Test if an Object is a String.

## isFunction(o)

Test if an Object is a Function.

# Telex

## Telex(arg)

Create a new Telex.
If the first argument is a string, it is used as the _to endpoint
for the new Telex. Otherwise all key-value pairs in the argument
are copied into the new Telex.
Example:
 new Telex("somehost.com:41234")
 new Telex({_to: "somehost.com:41234", _ring: 8980})

## Telex.hasSignals()

Test if a telex has signals. Signals start with a '+'.

## Telex.getCommands()

Get all the commands in this telex.
Returns an object of command names mapped to command parameter,
with leading '.' stripped off of command name.

## Telex.getSignals()

Get all the signals in this telex.
Returns an object of signal names mapped to command parameter,
with leading '+' stripped off of signal name.

# Switch

## Switch.start()

Start the switch.
The switch will start listening on its bind port
and start the bootstrap process.

## Switch.stop()

Stop the switch.

## Switch.startBootstrap()

Start the bootstrap process by sending a telex to the
bootstrap switch.

## Switch.completeBootstrap(remoteipp, telex)

Complete the bootstrap by processing the response from
the bootstrap switch.

## Switch.recv(msgstr, rinfo)

Dispatch incoming raw messages.
This method is called automatically on incoming dgram message.

## Switch.onCommand_see(remoteipp, telex, line)

Handle the .see TeleHash command.

## Switch.onCommand_tap(remoteipp, telex, line)

Handle the .tap TeleHash command.

## Switch.send(telex)

Send a telex.

## Switch.getline(endpoint)

Get the line for a host:port endpoint,
creating a new line if necessary.

## Switch.checkline(line, t, br)

Check a line's status.
True if open, false if ringing.

## Switch.scanlines()

line.line = line.ringin * line.ringout;
Update status of all lines, removing stale ones.

## Switch.near_to(end, ipp)

generate a .see for an +end, using a switch as a hint

## master

list of all lines, keyed by hash

## tap

tap options and rules

## NBUCKETS

 = 160 (SHA1)

## server

instance of udp4 server (doc/api/dgram.html)

# Hash

## Hash(value)

Hash objects represent a message digest of string content,
with methods useful to DHT calculations.
@constructor

## byte2hex(d)

Format a byte as a two digit hex string.

## Hash.far()

Get the hash as geometrically "far" as possible from this one.
That would be the logical inverse, every bit flipped.

## Hash.or(h)

Logical bitwise 'or' this hash with another.

## Hash.cmp(h)

Comparator for hash objects.

## Hash.distanceTo(h)

XOR distance between two sha1 hex hashes, 159 is furthest bit, 0 is closest bit, -1 is same hash

## Hash.toString()

Represent the hash as a hexadecimal string.

## Hash.equals(h)

Test if two hashes are equal.
