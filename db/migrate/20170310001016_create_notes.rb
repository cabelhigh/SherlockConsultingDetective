class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.string :text
      t.string :name
      t.string :clue
      t.string :address
      t.string :person

    end
  end
end
