class CreateWishlists < ActiveRecord::Migration[8.0]
  def change
    create_table :wishlists do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false, limit: 255
      t.text :description
      t.date :event_date
      t.string :slug, null: false, limit: 255
      t.integer :visibility, default: 1, null: false # 0: private, 1: link_only (default), 2: public
      t.string :theme_color, limit: 7 # hex color code
      t.json :metadata, default: {}
      t.boolean :active, default: true, null: false
      t.integer :wishes_count, default: 0, null: false # counter cache
      t.integer :claimed_wishes_count, default: 0, null: false # counter cache
      
      t.timestamps null: false
    end

    # Note: t.references :user already creates index_wishlists_on_user_id
    add_index :wishlists, :slug, unique: true
    add_index :wishlists, :visibility
    add_index :wishlists, :event_date
    add_index :wishlists, :active
    add_index :wishlists, :created_at
  end
end
