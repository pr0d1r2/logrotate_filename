= logrotate_filename

http://github.com/Pr0d1r2/logrotate_filename/tree/master

== DESCRIPTION:

Ruby class to manipulate logrotate file names

== FEATURES/PROBLEMS:

* Support for dated (convert numbers to day-dates (20081010))

== SYNOPSIS:

  logrotate_filename = Logrotate::Filename.new("/var/log/messages.1.lzma")
  FileUtils.mv(logrotate_filename, logrotate_filename.dated)

== REQUIREMENTS:

* Ruby 1.8.6

== INSTALL:

* sudo gem install logrotate_filename

== LICENSE:

(The MIT License)

Copyright (c) 2008 FIXME full name

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
