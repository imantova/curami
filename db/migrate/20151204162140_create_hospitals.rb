class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :address
      t.string :city
      t.string :name

      t.timestamps

    end
  end
end
