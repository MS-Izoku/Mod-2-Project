class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :full_name
      t.string :city
      t.string :programming_language
      t.string :img_url , default:"https://cdn3.movieweb.com/i/article/gIdrZFTvO1nsC16dRaTBMOzqaabBjj/798:50/The-Matrix-4-Reboot-Plot-Keanu-Reeves.jpg"
      t.timestamps
    end
  end
end
