class CreateChoices < ActiveRecord::Migration[6.0]
  def change
    create_table :choices do |t|
      t.integer :word_id
      t.string :content
      t.boolean :is_correct

      t.timestamps
    end
  end
end
