class CreateWishes < ActiveRecord::Migration[8.0]
  def change
    create_table :wishes do |t|
      t.references :wishlist, null: false, foreign_key: true
      t.string :title, null: false, limit: 255
      t.text :description
      t.text :url # product URL
      t.string :image_url, limit: 500
      t.decimal :price, precision: 10, scale: 2
      t.string :currency, limit: 3, default: 'USD'
      t.text :note # owner's private note
      t.integer :status, default: 0, null: false # 0: available, 1: claimed, 2: purchased
      t.integer :priority, default: 1, null: false # 0: low, 1: medium, 2: high
      t.json :metadata, default: {} # parsed OG data, store info, etc.
      t.boolean :active, default: true, null: false
      
      # Gift details
      t.string :brand, limit: 100
      t.string :category, limit: 100
      t.json :images, default: [] # array of image URLs
      
      t.timestamps null: false
    end

    add_index :wishes, :wishlist_id
    add_index :wishes, :status
    add_index :wishes, :priority
    add_index :wishes, :active
    add_index :wishes, :created_at
    add_index :wishes, :category
  end
end
