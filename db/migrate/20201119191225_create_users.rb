class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :name
      t.string :occupation
      t.string :description
      t.string :image
      t.string :bio
      t.string :contactmessage
      t.string :email
      t.string :phone
      t.string :website
      t.string :resumedownload
      t.timestamps
    end
  end
end
