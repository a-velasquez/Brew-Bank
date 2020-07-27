class CreateBrewers < ActiveRecord::Migration[6.0]
  def change
    create_table :brewers do |t|
      t.string :name
      t.string :type
      t.string :street
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country
      t.string :webpage_url

      t.timestamps
    end
  end
end
