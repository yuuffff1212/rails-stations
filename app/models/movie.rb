# frozen_string_literal: true

class Movie < ApplicationRecord
  validates :name, uniqueness: true

  # with_options presence: true do
  #   validates :name
  #   validates :description
  #   validates :image_url
  #   validates :year
  # end

  mount_uploader :image_url, ImageUploader
end
