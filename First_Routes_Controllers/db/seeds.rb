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

# ActiveRecord::Base.transaction do

    ArtworkShare.destroy_all
    Artwork.destroy_all
    User.destroy_all

    user1 = User.create!(username: 'Joe')
    user2 = User.create!(username: 'Collin')
    user3 = User.create!(username: 'Billy')
    user4 = User.create!(username: 'David')

    artwork1 = Artwork.create!(title: 'Da Vinci', img_url: 'google.com', artist_id: user1.id)
    artwork2 = Artwork.create!(title: 'Leonardo', img_url: 'yahoo.com', artist_id: user2.id)
    artwork3 = Artwork.create!(title: 'ASDSAD', img_url: 'ya.com', artist_id: user4.id)

    shared_work1 = ArtworkShare.create!(viewer_id: user3.id, artwork_id: artwork1.id)
    shared_work2 = ArtworkShare.create!(viewer_id: user4.id, artwork_id: artwork1.id)
    shared_work3 = ArtworkShare.create!(viewer_id: user4.id, artwork_id: artwork2.id)
# end