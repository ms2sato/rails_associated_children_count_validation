class CreatePattern1s < ActiveRecord::Migration[6.0]
  def change
    create_table :pattern1s do |t|
      t.string :title

      t.timestamps
    end
  end
end
