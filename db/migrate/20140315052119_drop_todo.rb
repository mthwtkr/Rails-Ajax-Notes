class DropTodo < ActiveRecord::Migration
	def up
		drop_table :todos
	end

	def down
		create_table :todos do |t|
			t.string :item
			t.boolean :completed

			t.timestamps
		end
	end
end
