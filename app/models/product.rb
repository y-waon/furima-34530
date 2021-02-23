class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  with_options presence: true do
    validates :title
    validates :text
    validates :image
  end
  validates :price,        numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, presence: true, format: { with: /\A[0-9]+\z/ }
  with_options numericality: { other_than: 1 } do
    validates :area_id
    validates :burden_id
    validates :category_id
    validates :guideline_id
    validates :status_id
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :burden
  belongs_to :category
  belongs_to :guideline
  belongs_to :status
end
