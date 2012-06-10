class AddBioToUser < ActiveRecord::Migration
  def change
    add_column :users, :Bio, :string
  end
end
