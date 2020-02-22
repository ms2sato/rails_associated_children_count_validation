class CreatePattern1Children < ActiveRecord::Migration[6.0]
  def change
    create_table :pattern1_children do |t|
      t.string :title
      t.reference :pattern1

      t.timestamps
    end
  end
end
