class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.references :account, :null => false
      t.string :name, :null => false
      t.text :description, :null => false
      t.datetime :start, :null => false
      t.datetime :end, :null => false
      t.boolean :private, :default => false
      t.string :address, :null => false
      t.string :city, :null => false
      t.string :state, :null => false
      t.integer :zip, :null => false
      t.float :latitude, :null => false
      t.float :longitude, :null => false
      t.boolean :gmaps 
	  t.integer :min, :default => 0, :null => false
	  t.integer :max, :default => 1, :null => false
      t.timestamps
    end
  end
end
