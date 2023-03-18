class Genre < ApplicationRecord

  has_many :items
  validates :genres_name, presence:true

end
