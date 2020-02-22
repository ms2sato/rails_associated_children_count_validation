class CreatePattern2s < ActiveRecord::Migration[6.0]
  def change
    create_table :pattern2s do |t|
      t.string :title

      t.timestamps
    end
  end
end
