class CreateDoctors < ActiveRecord::Migration[5.1]
  def change
    create_table :doctors do |t|
      t.string :username, null: false
      t.string :address, null: false
      t.string :gender, null: false

      t.timestamps
    end
  end
end
