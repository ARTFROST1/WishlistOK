class CreateClaims < ActiveRecord::Migration[8.0]
  def change
    create_table :claims do |t|
      t.references :wish, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true # includes guests
      t.integer :status, default: 0, null: false # 0: claimed, 1: purchased, 2: cancelled
      t.text :note # claimer's private note
      t.decimal :contribution_amount, precision: 10, scale: 2 # for group gifts
      t.string :currency, limit: 3, default: 'USD'
      t.json :metadata, default: {} # payment details, etc.
      t.datetime :purchased_at
      t.boolean :is_surprise, default: true, null: false # hidden from wishlist owner

      t.timestamps null: false
    end

    add_index :claims, :wish_id
    add_index :claims, :user_id
    add_index :claims, :status
    add_index :claims, :purchased_at
    add_index :claims, [:wish_id, :user_id], unique: true # prevent duplicate claims
    add_index :claims, :created_at
  end
end
