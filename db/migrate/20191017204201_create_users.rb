class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.integer :age
      t.integer :budget

      t.timestamps
    end
  end
end
