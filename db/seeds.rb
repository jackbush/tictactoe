# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Game.delete_all
TicTacToeBoard.delete_all
Player.delete_all

Game.create(name: "Tic Tac Toe", instructions: "On a 3x3 grid, claim three squares in a row.")