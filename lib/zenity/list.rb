# -*- encoding: utf-8 -*-

module Zenity

  class List < Base
    attr_writer :separator, :print_column

    def initialize columns = ["Column Title"], data = ["Data"], options = []
      @command = "zenity --list \\\n"
      unless options.empty?
        options.each do |o|
          if ['checklist', 'radiolist', 'editable'].include? o
            @command += "--#{o} \\\n" 
          else
            raise "Unknown option #{o} for zenity list"
          end
        end
      end
      columns.map! { |c| "--column=\"#{c}\"" }
      @command += columns.join(" ") + " \\\n"
      @command += data.join(" \\\n")
      @separator = nil
      @print_column = nil
    end

    def get_command
      @command + option_separator + option_print_column + title
    end

    private

    def option_separator
      if @separator.nil?
        ""
      else
        " --separator=#{@separator} " 
      end
    end

    def option_print_column
      if @print_column.nil?
        ""
      else
        " --print-column=#{@print_column} "
      end
    end

  end

end
