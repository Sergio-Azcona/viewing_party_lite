class CreateViewParties < ActiveRecord::Migration[5.2]
  def change
    create_table :view_parties do |t|
      t.float :duration
      t.datetime :start_time

      t.timestamps
    end
  end
end
