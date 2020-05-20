class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :content
      t.integer :user_id
      t.timestamps
    end
  end
end

#t is an object and string is a method and we cant know what coloumn
#there are a finite number of data types
#take the name as an argument
