class Item < ApplicationRecord

  belongs_to :genre, optional: true
  validates :title, presence:true

end
