# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  img_url    :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :artist_id, presence: true
    validates :title, presence: true, uniqueness: { scope: :artist_id, message: "Artist cannot have two arts with same title" }

    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User

    has_many :viewers,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare

    has_many :comments,
        foreign_key: :artwork_id,
        class_name: :Comment,
        dependent: :destroy

    has_many :shared_viewers,
        through: :viewers,
        source: :viewer
end
