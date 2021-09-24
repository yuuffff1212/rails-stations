# frozen_string_literal: true

class Movie < ApplicationRecord
  validates :name, uniqueness: true
  validates :is_showing, inclusion: { in: [true, false] }

  with_options presence: true do
    validates :name
    validates :description
    validates :image_url
    validates :year
  end

  def self.search(search)
    if search != ''
      Movie.where(['name LIKE(?) OR description LIKE(?)', "%#{search}%", "%#{search}%"])
    else
      Movie.all
    end

    if search != ''
      Movie.where(is_showing: search([:is_showing]))
    else
      Movie.all
    end
  end

  mount_uploader :image_url, ImageUploader
end
