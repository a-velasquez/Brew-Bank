class ChangeAlcoholToBeFloatInBeers < ActiveRecord::Migration[6.0]
  def up
    change_column :beers, :alcohol, :float 
  end

  def down 
    change_column :beers, :alcohol, :decimal 
  end
  
end
