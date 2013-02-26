# -*- encoding: utf-8 -*-

module Zenity

  # Internal: Base class for all dialog boxes.
  class Base
    attr_writer :title, :width, :height
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

      def general_options
        title + width + height
      end

      def title
        if defined? @title
          " --title=\"#{@title}\" "  
        else
          ""
        end
      end

      def width
        if defined? @width
          " --width=\"#{@width}\" "  
        else
          ""
        end
      end

      def height
        if defined? @height
          " --height=\"#{@height}\" "  
        else
          ""
        end
      end

  end
end
