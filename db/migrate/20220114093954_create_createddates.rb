class CreateCreateddates < ActiveRecord::Migration[7.0]
  def change
    create_table :createddates do |t|
      t.date :date

      t.timestamps
    end
  end
end
