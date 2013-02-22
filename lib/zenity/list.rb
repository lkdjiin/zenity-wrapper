# -*- encoding: utf-8 -*-

module Zenity

  # Public: List dialog box wrapper.
  class List < Base
    attr_writer :separator, :print_column

    def initialize columns = ["Column Title"], data = ["Data"], options = []
      @command = "zenity --list \\\n"
      unless options.empty?
        options.each do |opt|
          if ['checklist', 'radiolist', 'editable'].include? opt
            @command += "--#{opt} \\\n" 
          else
            raise "Unknown option #{opt} for zenity list"
          end
        end
      end
      columns.map! { |col| "--column=\"#{col}\"" }
      @command += columns.join(" ") + " \\\n"
      @command += data.join(" \\\n")
    end

    def get_command
      @command + option_separator + option_print_column + title
    end

    private

    def option_separator
      if defined? @separator
        " --separator=#{@separator} " 
      else
        ""
      end
    end

    def option_print_column
      if defined? @print_column
        " --print-column=#{@print_column} "
      else
        ""
      end
    end

  end

end
