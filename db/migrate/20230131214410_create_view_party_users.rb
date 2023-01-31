class CreateViewPartyUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :view_party_users do |t|
      t.references :user, foreign_key: true
      t.references :view_party, foreign_key: true
      t.boolean :host?

      t.timestamps
    end
  end
end
