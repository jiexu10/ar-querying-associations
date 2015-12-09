class Recipe < ActiveRecord::Base
  has_many :comments

  validates :title, uniqueness: true, format: { with: /Brussels Sprouts/ }, presence: true
  validates_presence_of :servings_valid?

  def servings_valid?
    servings.nil? || (servings.to_i.is_a?(Numeric) && servings.to_i >= 1)
  end
end
