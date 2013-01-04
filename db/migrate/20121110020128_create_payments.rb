class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :code

      t.timestamps
    end
  end
end
