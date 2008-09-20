stammer
    by Ben Scofield (of Viget Labs)
    http://www.github.com/bscofield/stammer

== DESCRIPTION:

This is meant to be a simple wrapper around the Yammer API - give it a username and password,
and it'll return messages visible to that account. For details on the API, look at 
http://www.yammer.com/company/api_doc

== FEATURES/PROBLEMS:

TODO
* handle client keys
* paginate messages (currently only returns the last 20 of whatever set is requested)
* post/delete messages
* implement non-message aspects of the API - e.g., users, tags, subscriptions

== SYNOPSIS:

  require 'rubygems'
  require 'stammer'
  
  stammer = Stammer.new('user@example.com', 'password')
  messages = stammer.messages
  sent_messages = stammer.messages('sent')

== REQUIREMENTS:

* Net::HTTP
* JSON

== INSTALL:

* sudo gem install stammer

== LICENSE:

(The MIT License)

Copyright (c) 2008 Ben Scofield of Viget Labs

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
