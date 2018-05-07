class UpdateEventPrice < ActiveRecord::Migration[5.2]
  def change
  	add_column :events, :price, :decimal, :precision => 8, :scale => 2
  end
end
