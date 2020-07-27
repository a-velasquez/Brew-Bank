class CreateBeers < ActiveRecord::Migration[6.0]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :type
      t.float :alcohol
      t.text :description
      t.belongs_to :brewer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
