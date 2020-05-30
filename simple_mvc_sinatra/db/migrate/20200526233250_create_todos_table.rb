class CreateTodosTable < ActiveRecord::Migration[6.0]
  def change
	   create_table :todos do |t|
	     t.string :content
    end

  end
end
