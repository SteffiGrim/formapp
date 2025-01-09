class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :mails
      t.text :address
      t.string :document_number
      t.string :phone
      t.text :comments

      t.timestamps
    end
  end
end
