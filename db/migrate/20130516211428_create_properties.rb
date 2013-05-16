class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name
      t.integer :bedroom
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
