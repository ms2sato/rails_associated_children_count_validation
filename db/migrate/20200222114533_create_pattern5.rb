class CreatePattern5 < ActiveRecord::Migration[6.0]
  def change
    create_table :pattern5s do |t|
      t.string :title
    end
  end
end
