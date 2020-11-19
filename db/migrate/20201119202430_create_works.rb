class CreateWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :works do |t|
      t.string :company
      t.string :title
      t.string :years
      t.string :description
      t.references :resume, null: false, foreign_key: true


      t.timestamps
    end
  end
end
