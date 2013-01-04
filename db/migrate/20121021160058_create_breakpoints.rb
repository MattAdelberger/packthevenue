class CreateBreakpoints < ActiveRecord::Migration
  def change
    create_table :breakpoints do |t|
      t.references :activity, :null => false
      t.integer :number
      t.integer :discount
      t.timestamps
    end
  end
end
