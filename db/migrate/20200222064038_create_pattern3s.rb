class CreatePattern3s < ActiveRecord::Migration[6.0]
  def change
    create_table :pattern3s do |t|
      t.string :title

      t.timestamps
    end
  end
end
