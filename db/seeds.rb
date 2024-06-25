# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

author = Publisher.create(name: 'Tatsuya Nakai', address: 'osaka')

book1 = { name: "Book 1", published_on: Time.current, price: 1000 }
book2 = { name: "Book 2", published_on: Time.current, price: 2000 }

author.books.create([book1, book2])

matz = Author.find_or_create_by(name: 'Matsumoto Yukihiro', penname: 'Matz')
dhh = Author.find_or_create_by(name: 'David Heinemeier Hansson', penname: 'DHH')

matz.books << Book.first
dhh.books << Book.last
dhh.books << Book.first
