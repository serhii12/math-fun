# This is the main entrypoint into the program
# It requires the other files/gems that it needs

require 'pry'
require './game'
require './player'
require './questions'
require './turn'

game = Game.new

game.start_game
