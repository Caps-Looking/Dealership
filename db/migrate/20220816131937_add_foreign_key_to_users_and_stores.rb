# frozen_string_literal: true

class AddForeignKeyToUsersAndStores < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :users, :stores
    add_foreign_key :stores, :addresses
  end
end
