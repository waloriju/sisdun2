class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string  :first_name, null: false
      t.string  :last_name,  null:false

      t.string  :gender,     null: false
      t.string  :cpf,        null: false

      t.date    :birth_date, null: false

      t.timestamps
    end
  end
end
