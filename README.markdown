zenity-wrapper
================


Description
-----------
What did you expect with that name? Zenity-wrapper is a ruby wrapper over
the [zenity utilily][2].

I wrote it because I need it for a personal project. It is far from complete,
it could only open **list** and **message** dialog boxes.
Anyway I release it because it could be helpfull to somebody.

Install
-------------------------

    gem install zenity-wrapper
    apt-get zenity


Usage
--------------------------

You should check [zenity documentation][1] first.

### Simple example

    require 'zenity'

    Zenity::Message.new(:error, "content text").proceed

### General options

A big error message:

    m = Zenity::Message.new(:error, "content text")
    m.title = "Big error message"
    m.width = 600
    m.height = 400
    m.proceed

### Exit Status

Zenity defines the following module constants:

+ OK
+ CANCEL
+ ERROR
+ EXPIRED

And the following methods for each dialogs classes:

+ `exit_status`
+ `ok?`
+ `cancel?`
+ `error?`
+ `expired?`

A dumb usage example:

    m = Zenity::Message.new(:question, "your question")
    answer = m.proceed
    if m.exit_status == Zenity::OK
      puts answer
    elsif m.expired?
      puts "too late..."
    end

### Returned Value

The `proceed` method returns a String.

### Calendar

TODO

### File Select

TODO

### Notification

TODO

### List

    list = List.new(columns = ["Reference", "Title"],
                    data = ['1 "title 1"', '2 "title 2"'])
    # You could modify the separator
    list.separator = "---"
    # You could modify the returned column(s)
    list.print_column = "ALL"
    puts list.proceed
    
### Message

    Message.new(:error, "This is an error message").proceed

    Message.new(:info, "This is an info message").proceed

    Message.new(:warning, "This is a warning message").proceed

    answer = Message.new(:question, "This is a question message").proceed
    puts answer

### Progress Bar

TODO

### Entry

TODO

### Text Info

TODO


Dependencies
--------------------------

+ ruby >= 1.9.3
+ zenity >= 2.30

License
--------------------------

MIT

    Copyright (c) 2013 Xavier Nayrac

    Permission is hereby granted, free of charge, to any person obtaining
    a copy of this software and associated documentation files (the
    "Software"), to deal in the Software without restriction, including
    without limitation the rights to use, copy, modify, merge, publish,
    distribute, sublicense, and/or sell copies of the Software, and to
    permit persons to whom the Software is furnished to do so, subject to
    the following conditions:

    The above copyright notice and this permission notice shall be included
    in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
    CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
    TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


Questions and/or Comments
--------------------------

Feel free to email [Xavier Nayrac](mailto:xavier.nayrac@gmail.com)
with any questions.


[1]: http://help.gnome.org/users/zenity/2.32/
[2]: http://en.wikipedia.org/wiki/Zenity 
