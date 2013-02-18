# -*- encoding: utf-8 -*-

module Zenity

  class Message < Base

    def initialize type, text
      if ['error', 'warning', 'question', 'info'].include? type
        @command = "zenity --#{type} --text=\"#{text}\""
      else
        raise "Unknown message type #{type} for zenity message"
      end
    end

    def get_command
      @command + title
    end

  end

end

