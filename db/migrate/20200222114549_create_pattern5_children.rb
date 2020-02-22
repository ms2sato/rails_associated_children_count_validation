class CreatePattern5Children < ActiveRecord::Migration[6.0]
  def change
    create_table :pattern5_children do |t|
      t.string :title
      t.references :pattern5, null: false, foreign_key: true
    end
  end
end
