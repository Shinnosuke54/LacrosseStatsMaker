class CreateStats < ActiveRecord::Migration[7.0]
  def change
    create_table :stats do |t|
      t.string :name
      t.integer :score
      t.integer :shot
      t.integer :gb
      t.integer :bd
      t.integer :pc
      t.integer :createddate_id

      t.timestamps
    end

    # create_table :createddates do |t|
    #   t.date :date

    #   t.timestamps
    # end
  end
end
