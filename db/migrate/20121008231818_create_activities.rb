class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.references :account, :null => false
      t.string :name, :null => false
      t.text :description, :null => false
      t.text :location_description
      t.datetime :start, :null => false
      t.datetime :end, :null => false
      t.string :address, :null => false
      t.string :city, :null => false
      t.string :state, :null => false
      t.integer :zip, :null => false
      t.float :latitude, :null => false
      t.float :longitude, :null => false
      t.boolean :gmaps 
	    t.integer :max_capacity, :null => false
	    t.integer :min_capacity
	    t.decimal :reduced_ticket, :null => false
	    t.decimal :starting_ticket, :null => false
	    t.boolean :include_fee
	    t.string :category, :null => false
	    t.integer :final_price
	    t.string :status
      t.timestamps
    end
  end
end
