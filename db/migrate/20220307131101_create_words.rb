class CreateWords < ActiveRecord::Migration[6.0]
  def change
    create_table :words do |t|
      t.integer :category_id
      t.string :content

      t.timestamps
    end
  end
end
