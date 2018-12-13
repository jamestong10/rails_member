class Product < ApplicationRecord
  has_many_attached :images
  paginates_per 10
end
