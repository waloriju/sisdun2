class AddIndexToCompaniesCnpj < ActiveRecord::Migration
  def change
    add_index :companies, :cnpj, unique: true
  end
end
