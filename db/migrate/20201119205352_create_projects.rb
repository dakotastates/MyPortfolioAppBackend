class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :category
      t.string :image
      t.string :url
      t.references :portfolio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
