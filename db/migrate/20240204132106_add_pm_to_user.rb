class AddPmToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :pm, :boolean, default: false
  end
end
