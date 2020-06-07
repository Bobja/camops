class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.date :date
      t.string :name
      t.string :company
      t.string :address
      t.integer :unitPrice
      t.integer :totalPrice
      t.text :details
      t.integer :user_id

      t.timestamps
    end
  end
end
