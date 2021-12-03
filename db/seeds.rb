# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times  do
	User.create({
		name: Faker::Name.first_name,
		cpf: Faker::Number.leading_zero_number(digits: 10)
	})
end

10.times do
	Produto.create({
		name: Faker::Book.title,
		descricao: Faker::Book.genre,
		quantidade: Faker::Number.between(from: 1, to: 10),
		user_id: Faker::Number.between(from: 1, to: 50)
	})
	Produto.create({
		name: Faker::Device.model_name,
		descricao: Faker::Device.manufacturer,
		quantidade: Faker::Number.between(from: 1, to: 3),
		user_id: Faker::Number.between(from: 1, to: 50)
	})
	Produto.create({
		name: Faker::Game.title,
		descricao: Faker::Game.genre,
		quantidade: 1,
		user_id: Faker::Number.between(from: 1, to: 50)
	})
end
