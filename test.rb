# Persistencia por alcance:

# rails console:
# eval(File.read 'test.rb')

# cambiar algo  del código para que tire error y no complete la transacción.

# rails rails db:reset && rails db:seed para resetear la base de datos con datos de pruebas

User.transaction do
	# Creación de un usuario:
	user = User.create({
	    email: "test@test.com",
	    password: "password"
	})

	#user = User.find(1) # admin user: admin@admin.com; pass: administrator

	# Creación de una granja:
	farm = Farm.create({
	    name: "Farm Test",
	    description: "Farm test description",
	    address: "Somewhere address"
	})

	# Creación de dos lotes asociados a la granja creada previamente:
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
	# Se agrega el lote "plot_one" a la colección de lotes de la granja
	farm.plots << plot_one
	# Se agrega el lote "plot_two" a la colección de lotes de la granja
	farm.plots << plot_two
	# Se agrega la granja a la colección de de granjas del usuario "test@test.com"
	user.farms << farm
# Al finalizar la transacción se persiste el usuario (si todo sale correctamente) y los objetos que estén asociados a él: user --> granja --> lotes.
# En caso de que falle la transacción, se realiza rollback y no se modifica nada.
end
