class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      # 以下の2行を追加
      t.integer :genre_id
      t.string :name
      t.text :introduction
      t.integer :price
      t.boolean :is_active, :default => true
      t.timestamps
    end
  end
end