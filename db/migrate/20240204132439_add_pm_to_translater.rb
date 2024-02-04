class AddPmToTranslater < ActiveRecord::Migration[7.0]
  def change
    add_column :translaters, :pm, :boolean, default: false
  end
end
