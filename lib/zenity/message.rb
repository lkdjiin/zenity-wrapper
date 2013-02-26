# -*- encoding: utf-8 -*-

module Zenity

  # Public: Boite de dialogue de message.
  class Message < Base

    # Public:
    #
    # type - A String, the type of the message, one of:
    #        'error'
    #        'warning'
    #        'question'
    #        'info'
    # text - The text String to display in dialog box.
    def initialize type, text
      if [:error, :warning, :question, :info].include? type
        @command = "zenity --#{type} --text=\"#{text}\""
      else
        raise "Unknown message type #{type} for zenity message"
      end
    end

    # Internal: Get the shell command for the dialog box.
    # Used mostly for testing purposes.
    #
    # Returns the shell command as a String
    def get_command
      @command + general_options
    end

  end

end

