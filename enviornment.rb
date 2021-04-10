require 'bundler/setup'
Bundler.require

FONT = TTY::Font.new(:starwars)
PASTEL = Pastel.new

require_all 'lib'