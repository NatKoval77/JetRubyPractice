class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.text :email
      t.text :first_name
      t.text :last_name

      t.timestamps
    end
  end
end
