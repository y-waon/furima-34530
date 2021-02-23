class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  validates :title,        presence: true
  validates :text,         presence: true
    validates :price,        numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, presence: true, format: { with: /\A[0-9]+\z/ }
  validates :area_id,      numericality: { other_than: 1 }
  validates :burden_id,    numericality: { other_than: 1 }
  validates :category_id,  numericality: { other_than: 1 }
  validates :guideline_id, numericality: { other_than: 1 }
  validates :status_id,    numericality: { other_than: 1 }
  validates :image,       presence: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :burden
  belongs_to :category
  belongs_to :guideline
  belongs_to :status
end
