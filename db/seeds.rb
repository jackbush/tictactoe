# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Game.delete_all
Board.delete_all
BoardsPlayer.delete_all
Player.delete_all

g1 = Game.create(name: "Tic Tac Toe")

b1 = Board.create(game_id: g1.id)

p1 = Player.create(username: "test1")
p2 = Player.create(username: "test2")

BoardsPlayer.create(board_id: b1.id, player_id: p1.id, winner: true)
BoardsPlayer.create(board_id: b1.id, player_id: p2.id, winner: false)