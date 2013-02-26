NAME
================


Description
-----------


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

### Message

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



Questions and/or Comments
--------------------------

Feel free to email [Xavier Nayrac](mailto:xavier.nayrac@gmail.com)
with any questions.


[1]: http://help.gnome.org/users/zenity/2.32/
