class ChangeFacebookColumnInUser < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.change :Facebook, :text
    end
  end

  def down
      t.change :Facebook, :varchar
  end
end
