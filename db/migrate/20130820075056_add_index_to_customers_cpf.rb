class AddIndexToCustomersCpf < ActiveRecord::Migration
  def change
    add_index :customers, :cpf, unique: true 
  end
end
