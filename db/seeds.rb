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

Player.create(username: "test1", games_played: 43, games_won: 14)
Player.create(username: "test2", games_played: 3, games_won: 1)
Player.create(username: "test3", games_played: 12, games_won: 11)
Player.create(username: "test4", games_played: 67, games_won: 54)