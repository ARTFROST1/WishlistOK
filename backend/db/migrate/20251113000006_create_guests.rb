class CreateGuests < ActiveRecord::Migration[8.0]
  def change
    create_table :guests do |t|
      t.references :user, null: false, foreign_key: true
      t.string :identifier, null: false, limit: 255 # guest_{uuid}
      t.string :session_token, limit: 255
      t.inet :ip_address
      t.string :user_agent, limit: 500
      t.json :metadata, default: {}
      t.datetime :last_activity_at
      t.boolean :converted_to_regular, default: false, null: false
      t.datetime :converted_at

      t.timestamps null: false
    end

    add_index :guests, :user_id, unique: true # one guest record per user
    add_index :guests, :identifier, unique: true
    add_index :guests, :session_token, unique: true
    add_index :guests, :last_activity_at
    add_index :guests, :converted_to_regular
  end
end
