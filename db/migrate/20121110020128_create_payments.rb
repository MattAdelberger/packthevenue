class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :account, :null => false
      t.references :activity, :null => false
      t.string :status, :null => false
      t.integer :quantity, :null => false
      t.timestamps
    end
  end
end
