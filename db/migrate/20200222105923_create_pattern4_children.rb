class CreatePattern4Children < ActiveRecord::Migration[6.0]
  def change
    create_table :pattern4_children do |t|
      t.string :title
      t.references :pattern4, null: false, foreign_key: true
    end
  end
end
