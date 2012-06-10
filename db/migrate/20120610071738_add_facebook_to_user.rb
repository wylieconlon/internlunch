class AddFacebookToUser < ActiveRecord::Migration
  def change
    add_column :users, :Facebook, :string
  end
end
