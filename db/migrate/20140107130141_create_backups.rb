class CreateBackups < ActiveRecord::Migration
  def change
    create_table :backups do |t|
      t.string :path
      t.integer :account_id

      t.timestamps
#      add_index :backups, [:account_id, :path]
    end
  end
end
