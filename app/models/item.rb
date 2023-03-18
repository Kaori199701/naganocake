class Item < ApplicationRecord

  has_many :item_genre_relations
  has_many :genres, through: :item_genre_relations

  validates :is_active, inclusion: { in: [true, false] }

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end
