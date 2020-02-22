class CreatePattern3Children < ActiveRecord::Migration[6.0]
  def change
    create_table :pattern3_children do |t|
      t.string :title
      t.references :pattern3, null: false, foreign_key: true

      t.timestamps
    end
  end
end
