class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.string :genres_name, null: false

      t.timestamps
    end
  end
end
