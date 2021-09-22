# frozen_string_literal: true

class Movie < ApplicationRecord
  validates :name, uniqueness: true

  mount_uploader :image_url, ImageUploader
end
