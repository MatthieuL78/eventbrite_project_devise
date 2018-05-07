class ModifyEventTableCreatorId < ActiveRecord::Migration[5.2]
  def change
  	remove_column :events, :creator_id_id
  	change_table :events do |t|
      t.belongs_to :creator, index: true
    end
  end
end
