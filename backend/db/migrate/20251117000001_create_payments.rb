class CreatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :payments do |t|
      # References
      t.references :claim, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :wish, null: false, foreign_key: true

      # Payment provider details
      t.string :provider, null: false, default: 'yookassa' # yookassa, cloudpayments
      t.string :provider_payment_id, null: false # External payment ID from provider
      t.string :payment_method # card, yoomoney, qiwi, etc.

      # Amount details
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.string :currency, null: false, default: 'RUB'
      t.decimal :fee, precision: 10, scale: 2 # Provider fee

      # Payment status
      t.integer :status, null: false, default: 0
      # 0: pending, 1: processing, 2: succeeded, 3: failed, 4: cancelled, 5: refunded

      # Payment metadata
      t.string :description
      t.jsonb :metadata, default: {} # Additional payment data
      t.jsonb :provider_response, default: {} # Raw provider response

      # Confirmation & receipts
      t.string :confirmation_url # Payment confirmation page URL
      t.string :receipt_url # Receipt URL

      # Timestamps
      t.datetime :confirmed_at
      t.datetime :failed_at
      t.datetime :refunded_at

      t.timestamps
    end

    # Indexes
    add_index :payments, :provider_payment_id, unique: true
    add_index :payments, :status
    add_index :payments, [:user_id, :created_at]
    add_index :payments, [:wish_id, :status]
    add_index :payments, :created_at
  end
end
