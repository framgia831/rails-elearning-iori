# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "Admin",
			 email: "admin@email.com",
			 password: "admin0000",
			 admin: "true")

require 'faker'

50.times do |i|
	User.create(
		name: Faker::Pokemon.name, 
		email: Faker::Internet.email, 
		password: "password")
end


5.times do |i|
	category = Category.create!(
		title: Faker::Job.title,
		description: Faker::Job.field
		)
	
	5.times do
		word = category.words.build(
			content: Faker::Job.position
		    )

		3.times do
			word.words_answers.build(
				content: Faker::Job.unique.employment_type
				)
		end

		random_num = rand(0..2)
		word.words_answers[random_num].correct = true

	    word.save!
	end
end