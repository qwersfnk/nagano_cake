class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :order_details
  has_many :cart_items, dependent: :destroy

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/sample.png')
      image.attach(io: File.open(file_path), filename: 'sample.png', content_type: 'image/png')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

end