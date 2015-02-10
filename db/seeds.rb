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

g1 = Game.create(name: "Tic Tac Toe", instructions: "on a 3x3 grid, get three symbols in a row.")

b1 = TicTacToeBoard.create(game_id: g1.id)

p1 = Player.create(username: "test1")
p2 = Player.create(username: "test2")
