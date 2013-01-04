class CreateTicketTypes < ActiveRecord::Migration
  def change
    create_table :ticket_types do |t|
      t.references :activity, :null => false
      t.string :ticketname, :null => false
      t.integer :ticket_price, :null => false
      t.integer :max_price, :null => false
      t.integer :number, :default => 1, :null => false
      t.timestamps
    end
  end
end
