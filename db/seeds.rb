# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


admin = User.create({
    email: "admin@admin.com",
    password: 'administrator' 
})

admin.add_role :admin

#### Datos para tests (comentar en produccion)

user_one = User.create({
    email: "one@one.com",
    password: "password"
})

user_two = User.create({
    email: "two@two.com",
    password: "password"
})

user_three = User.create({
    email: "three@three.com",
    password: "password"
})

farm_one = Farm.create({
    name: "Farm one",
    description: "Farm's user one",
    address: "Address One"
})

farm_two = Farm.create({
    name: "Farm two",
    description: "Farm's user two"
})

farm_three = Farm.create({
    name: "Farm three",
    description: "Farm's user three"
})

farm_four = Farm.create({
    name: "Farm four",
    description: "Farm's user four"
})

user_one.farms << farm_one
user_two.farms << farm_two
user_three.farms << farm_three
user_one.farms << farm_four
user_two.farms << farm_four

plot_one = Plot.create({
    farm_id: farm_one.id,
    identifier: "Identifier plot one",
    surface: 1000,
    greenhouse: false,
    description: "Plot of farm one"
})

plot_two = Plot.create({
    farm_id: farm_one.id,
    identifier: "Identifier plot two",
    surface: 100,
    greenhouse: true,
    description: "Plot of farm one"
})

species_one = Species.create({
    name: "Species One"
})

species_two = Species.create({
    name: "Species Two"
})

problem_one = Problem.create({
    name: "Problem one",
    scientific_name: "SCientific name problem one"
})

problem_two = Problem.create({
    name: "Problem two",
    scientific_name: "Scientific name problem two"
})

product_one = Product.create({
    name: "Product one name",
    composition: "Composition product one",
    description: "Description of product one"
})

product_two = Product.create({
    name: "Product two name",
    composition: "Composition product two"
})

variety_one = Variety.create({
    name: "Variety one name",
    scientific_name: "Scientific name variety One"
})

variety_two = Variety.create({
    name: "Variety two name",
    scientific_name: "Scientific name variety Two"
})

plantation_one = Plantation.create({
    plot_id: plot_one.id,
    species_id: species_one.id,
    amount: 100,
    comment: "Comment plantation one"
})

plantation_two = Plantation.create({
    plot_id: plot_one.id,
    species_id: species_one.id,
    amount: 1000,
    comment: "Comment plantation two"
})

plantation_three = Plantation.create({
    plot_id: plot_one.id,
    species_id: species_two.id,
    amount: 10,
    comment: "Comment plantation three"
})

plantation_four = Plantation.create({
    plot_id: plot_two.id,
    species_id: species_one.id,
    amount: 100,
    comment: "Comment plantation one for plot two"
})

crop_one = Crop.create({
    plot_id: plot_one.id,
    variety_id: variety_one.id,
    amount: 100,
    comment: "Comment crop one"
})

crop_two = Crop.create({
    plot_id: plot_one.id,
    variety_id: variety_one.id,
    amount: 1000,
    comment: "Comment variety two"
})

crop_three = Crop.create({
    plot_id: plot_one.id,
    variety_id: variety_two.id,
    amount: 10,
    comment: "Comment variety three"
})

crop_four = Crop.create({
    plot_id: plot_two.id,
    variety_id: variety_one.id,
    amount: 100,
    comment: "Comment variety one for plot two"
})

plot_problem_one = PlotProblem.create({
    plot_id: plot_one.id,
    problem_id: problem_one.id,
    comment: "Comment plot problem one"
})

plot_problem_two = PlotProblem.create({
    plot_id: plot_one.id,
    problem_id: problem_one.id,
    comment: "Comment plot problem two"
})

plot_problem_three = PlotProblem.create({
    plot_id: plot_one.id,
    problem_id: problem_two.id,
    comment: "Comment plot problem three"
})

plot_problem_four = PlotProblem.create({
    plot_id: plot_two.id,
    problem_id: variety_one.id,
    comment: "Comment plot problem one for plot two"
})

application_one = ProductApplication.create({
    plot_id: plot_one.id,
    product_id: product_one.id,
    amount: 100,
    comment: "Comment product application one"
})

application_two = ProductApplication.create({
    plot_id: plot_one.id,
    product_id: product_one.id,
    amount: 1000,
    comment: "Comment product application two"
})

application_three = ProductApplication.create({
    plot_id: plot_one.id,
    product_id: product_two.id,
    amount: 10,
    comment: "Comment product application three"
})

application_four = ProductApplication.create({
    plot_id: plot_two.id,
    product_id: product_one.id,
    amount: 100,
    comment: "Comment product application one for plot two"
})