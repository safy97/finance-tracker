class DropIntsallMigration < ActiveRecord::Migration[5.2]
  def change
    drop_table :installs  do |t|
      t.string :email, null: false
      t.timestamps null: false
    end
  end
end
