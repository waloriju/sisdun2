class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string  :line1,                             null: false
      t.string  :line2,                             null: false
      t.string  :number,                            null: false
      t.string  :postal_code,                       null: false
      t.references :addressable, polymorphic: true, null: false
      t.references :city,                           null: false

      t.timestamps
    end
    add_index :addresses, :city_id
  end
end
