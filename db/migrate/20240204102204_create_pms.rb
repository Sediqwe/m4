class CreatePms < ActiveRecord::Migration[7.0]
  def change
    create_table :pms do |t|
      t.string :subject
      t.integer :user
      t.integer :sender
      t.boolean :read
      t.boolean :torolt
      t.boolean :warn

      t.timestamps
    end
  end
end
