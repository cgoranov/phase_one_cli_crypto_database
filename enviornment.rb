require 'bundler'
Bundler.require

FONT = TTY::Font.new(:starwars)
PASTEL = Pastel.new

require_all 'lib'