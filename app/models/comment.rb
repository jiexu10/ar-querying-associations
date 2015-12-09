class Comment < ActiveRecord::Base
  belongs_to :recipe

  # validates_with RecipeExists
  validates :body, length: { maximum: 140 }
  validates_presence_of :recipe_exists?
  # validates :recipe_id, presence: true, if: Proc.new { |a| true == false }
  #
  def recipe_exists?
    !recipe.nil?
  #   true == false
  end
end

# class RecipeExists
#   def validate(record)
#     if record.body.length > 10
#       record.errors[:body] << "more than 10"
#     end
#     if !record.recipe.nil?
#       record.errors[:recipe_id] << "recipe no exist"
#     end
#   end
# end
