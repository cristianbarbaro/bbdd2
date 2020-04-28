# Persistencia por alcance:

# rails console:
# eval(File.read 'test.rb')

# cambiar algo  del código para que tire error y no complete la transacción.

# rails rails db:reset && rails db:seed para resetear la base de datos con datos de pruebas

User.transaction do

	user = User.create({
	    email: "test@test.com",
	    password: "password"
	})

	#user = User.find(1) # admin user: admin@admin.com; pass: administrator

	farm = Farm.create({
	    name: "Farm Test",
	    description: "Farm test description",
	    address: "Somewhere address"
	})

	plot_one = Plot.create({
	    farm_id: farm.id,
	    identifier: "Identifier plot test",
	    surface: 1000,
	    greenhouse: false,
	    description: "Description plot test one"
	})

	plot_two = Plot.create({
	    farm_id: farm.id,
	    identifier: "Identifier plot test number two",
	    surface: 100,
	    greenhouse: true,
	    description: "Description plot test one"
	})

	farm.plots << plot_one

	farm.plots << plot_two

	user.farms << farm

end
