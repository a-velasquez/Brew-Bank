class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    change_table :reviews do |t|
      t.rename :name, :title
    end
  end
end
