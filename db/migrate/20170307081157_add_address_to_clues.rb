class AddAddressToClues < ActiveRecord::Migration[5.0]
  def change
    add_reference :clues, :address, foreign_key: true
  end
end
