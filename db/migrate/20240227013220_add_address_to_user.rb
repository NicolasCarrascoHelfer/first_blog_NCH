class AddAddressToUser < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :address, foreign_key: true
  end
end
