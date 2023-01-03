class CreateFarms < ActiveRecord::Migration[6.1]
  def change
    create_table :farms do |t|
      t.string :farm_name
      t.date :year_of_establish
      t.string :village_name
      t.string :farm_address
      t.string :bird_type
      t.string :category
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
