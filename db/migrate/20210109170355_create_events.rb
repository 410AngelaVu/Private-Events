class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :title
      t.references :creator

      t.timestamps
    end
  end
end
