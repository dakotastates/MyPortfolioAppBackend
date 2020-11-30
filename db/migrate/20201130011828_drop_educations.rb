class DropEducations < ActiveRecord::Migration[6.0]
  def change
    drop_table :educations
    drop_table :skills
    drop_table :works

  end
end
