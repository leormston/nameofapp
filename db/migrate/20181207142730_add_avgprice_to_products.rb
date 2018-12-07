class AddAvgpriceToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :avgprice, :float
  end
end
