class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :phone1,                             null: false
      t.string :phone2                             
      t.string :phone3                             
      t.string :email                              
      t.references :contactable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
