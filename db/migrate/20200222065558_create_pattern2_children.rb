class CreatePattern2Children < ActiveRecord::Migration[6.0]
  def change
    create_table :pattern2_children do |t|
      t.string :title
      t.references :pattern2, null: false, foreign_key: true

      t.timestamps
    end
  end
end
