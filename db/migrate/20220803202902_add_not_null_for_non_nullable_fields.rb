# frozen_string_literal: true

class AddNotNullForNonNullableFields < ActiveRecord::Migration[7.0]
  def change
    change_column :stores, :name, :string, null: false

    change_table :addresses, bulk: true do |t|
      t.change :cep, :string, null: false
      t.change :state, :string, null: false
      t.change :city, :string, null: false
      t.change :district, :string, null: false
      t.change :street, :string, null: false
      t.change :number, :string, null: false
      t.change :complement, :text, null: true
    end
  end
end
