class CreateRecipesteps < ActiveRecord::Migration[5.0]
  def change
    create_table :recipesteps do |t|
      t.string :title
      t.text :description
      t.integer :order
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end
