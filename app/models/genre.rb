class Genre < ApplicationRecord

  # has_many :item_genre_relations
  # has_many :items, through: :item_genre_relations
  has_many :items

  validates :genres_name, presence:true

end
