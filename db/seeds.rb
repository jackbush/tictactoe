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

admin = Player.new
admin.username = 'jack'
admin.email = 'bush.jack@gmail.com'
admin.password = 'password'
admin.password_confirmation = 'password'
admin.role = 'admin'
admin.save!

generic = Player.new
generic.username = 'agnes'
generic.email = 'agnes@app.com'
generic.password = 'password'r
generic.password_confirmation = 'password'
generic.save!

computer = Player.new
computer.username = 'computer'
computer.email = 'jackscomputer000@gmail.com'
computer.password = 'password'
computer.password_confirmation = 'password'
computer.save!