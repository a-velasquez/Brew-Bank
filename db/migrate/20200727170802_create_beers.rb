class CreateBeers < ActiveRecord::Migration[6.0]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :brewer
      t.float :alcohol
      t.text :description
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
