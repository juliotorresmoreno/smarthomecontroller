class CreatePublicacions < ActiveRecord::Migration[5.0]
  def change
    create_table :publicacions do |t|
      t.string :titulo
      t.text :contenido

      t.timestamps
    end
  end
end
