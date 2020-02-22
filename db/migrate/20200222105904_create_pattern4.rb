class CreatePattern4 < ActiveRecord::Migration[6.0]
  def change
    create_table :pattern4s do |t|
      t.string :title
    end
  end
end
