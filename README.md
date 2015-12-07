<!-- Answer the following questions: -->
<!-- How would you return all the recipes in your database? -->
Recipe.all
<!-- How would you return all the comments in your database? -->
Comment.all
<!-- How would you return the most recent recipe posted in your database? -->
Recipe.order(created_at: :desc).limit(1)
<!-- How would you return all the comments of the most recent recipe in your database? -->
last_recipe_id = Recipe.order(created_at: :desc).limit(1).pluck(:id)
Comment.where(recipe_id: last_recipe_id)
<!-- How would you return the most recent comment of all your comments? -->
Comment.order(created_at: :desc).limit(1)
<!-- How would you return the recipe associated with the most recent comment in your database? -->
last_comment_recipe = Comment.order(created_at: :desc).limit(1).pluck(:recipe_id)
Recipe.find(last_comment_recipe)
<!-- How would you return all comments that include the string brussels in them? -->
Comment.where("body ILIKE ?", "%brussels%").all
