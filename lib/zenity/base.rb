# -*- encoding: utf-8 -*-

module Zenity
  class Base
    attr_writer :title
    def initialize
      @title = nil
    end

    def proceed
      %x[ get_command ]
    end

    private

    def title
      if @title.nil?
        ""
      else
        " --title=\"#{@title}\" "  
      end
    end
  end
end
