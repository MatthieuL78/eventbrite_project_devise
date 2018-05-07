class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.string :place, null: false
      t.string :description, null: false
      t.datetime :date, nulls: false
      t.belongs_to :creator_id, index: true

      t.timestamps
    end
  end
end
