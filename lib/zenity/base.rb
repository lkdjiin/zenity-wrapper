# -*- encoding: utf-8 -*-

module Zenity

  # Internal: Base class for all dialog boxes.
  class Base
    attr_writer :title
    attr_reader :exit_status

    def initialize
      @exit_status = nil
    end

    def proceed
      ret = %x[ #{get_command} ]
      @exit_status = $?.exitstatus
      ret.delete("\n")
    end

    private

    def title
      if defined? @title
        " --title=\"#{@title}\" "  
      else
        ""
      end
    end
  end
end
