# -*- encoding: utf-8 -*-

$LOAD_PATH.unshift File.dirname(__FILE__)
$ZENITY_PATH = File.expand_path(File.expand_path(File.dirname(__FILE__)) + '/..')

require 'zenity/base'
require 'zenity/list'
require 'zenity/message'

module Zenity
  OK = 0
  CANCEL = 1
  ERROR = -1
  EXPIRED = 5
end
