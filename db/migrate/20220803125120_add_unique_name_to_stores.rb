# frozen_string_literal: true

class AddUniqueNameToStores < ActiveRecord::Migration[7.0]
  def change
    add_index :stores, :name, unique: true
  end
end
