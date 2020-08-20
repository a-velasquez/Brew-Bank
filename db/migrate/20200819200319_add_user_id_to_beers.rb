class AddUserIdToBeers < ActiveRecord::Migration[6.0]
  def change
    add_column :beers, :user_id, :integer
  end
end
