# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ApplicationRecord.connection.reset_pk_sequence!('users')
# ApplicationRecord.connection.reset_pk_sequence!('artworks')
# ApplicationRecord.connection.reset_pk_sequence!('artwork_shares')

ActiveRecord::Base.transaction do
    user1 = User.create!(username: 'Joe')
    user2 = User.create!(username: 'Collin')
    user3 = User.create!(username: 'Billy')
    user4 = User.create!(username: 'David')


    artwork1 = Artwork.create!(title: 'Da Vinci', img_url: 'google.com', artist_id: 1)
    artwork2 = Artwork.create!(title: 'Leonardo', img_url: 'yahoo.com', artist_id: 2)
end