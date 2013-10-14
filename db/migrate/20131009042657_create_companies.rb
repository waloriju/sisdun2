class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :company_name, null: false
      t.string :trading_name, null: false
      t.string :cnpj,         null: false
      
      t.timestamps
    end
  end
end
