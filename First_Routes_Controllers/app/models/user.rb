# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true

    has_many :artworks,
        dependent: :destroy,
        foreign_key: :artist_id,
        class_name: :Artwork

    has_many :viewer_artworks,
        dependent: :destroy,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare

    has_many :comments,
        foreign_key: :author_id,
        class_name: :Comment,
        dependent: :destroy

    has_many :shared_artworks,
        through: :viewer_artworks,
        source: :artwork

        
    # def self.whatever(:id)
    #     do stuff
    # end
end
