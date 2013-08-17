class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string  :first_name, null: false
      t.string  :last_name,  null:false

      t.string  :gender
      t.string  :cpf

      t.date    :birth_date

      t.timestamps
    end
  end
end
