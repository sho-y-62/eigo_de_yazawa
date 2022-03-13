class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.integer :category_id
      t.integer :score

      t.timestamps
    end
  end
end
