<!-- Answer the following questions: -->
<!-- How would you return all the recipes in your database? -->
Recipe.all
<!-- How would you return all the comments in your database? -->
Comment.all
<!-- How would you return the most recent recipe posted in your database? -->
Recipe.order(created_at: :desc).limit(1)
<!-- How would you return all the comments of the most recent recipe in your database? -->
last_recipe = Recipe.order(created_at: :desc).limit(1).first
last_recipe.comments
<!-- How would you return the most recent comment of all your comments? -->
Comment.order(created_at: :desc).limit(1)
<!-- How would you return the recipe associated with the most recent comment in your database? -->
last_comment = Comment.order(created_at: :desc).limit(1).first
last_comment.recipe
<!-- How would you return all comments that include the string brussels in them? -->
Comment.where("body ILIKE ?", "%brussels%")

<!-- CODE TO CHECK VALIDATIONS -->
recipe = Recipe.new({title: "Brussels Sprouts thing", ingredients: "a", steps: "b"})

recipe.valid?
<!-- TRUE -->

recipe = Recipe.new({title: "Brussels Sprouts thing", servings: 0, ingredients: "a", steps: "b"})

recipe.valid?
<!-- FALSE -->

recipe = Recipe.new({title: "Brussels Sprouts thing", servings: 30, ingredients: "a", steps: "b"})

recipe.valid?
<!-- TRUE -->

long_comment = Comment.new({body: "jdalsfkdlksfjlsadjfkasdjflsdajflkasdjfdlskafjdslfjlaksdfjlsadfjlasdkfjalsdfjlasdjkfajsdlfkasdjflksdajflksajdflkdjsaflkjdlfjasdlkfjasdljfladsjflaksdjflkadsjfldsjfklasdjflkjadsklfjasdlkfjlkfjsladkfjlaksdjflsadjflaksdjflaskdjflaksdjflaskdjflkasdjflkdajfldsjflkdsajflkasdjflkasdjflaksdfjlaskdjfldksafjldskfjasdlfjsaldkfjsaldkfjsaldkfjs", recipe_id: 3})

long_comment.valid?
<!-- FALSE -->

invalid_comment = Comment.new({body: "asdf", recipe_id: 99})

invalid_comment.valid?
<!-- FALSE -->

good_comment = Comment.new({body: "asdf", recipe_id: 3})

good_comment.valid?
<!-- TRUE -->
