class AddSizeToBackups < ActiveRecord::Migration
  def change
    add_column :backups, :size, :integer   
    add_index :backups, :size
  end
end
