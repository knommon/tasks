class AddProviderToUsers < ActiveRecord::Migration
  def change
		add_column :users, :name, :string
		add_column :users, :image, :string
		add_column :users, :provider, :integer, default: nil
		add_column :users, :uid, :string
		add_column :users, :oauth_token, :string
		add_column :users, :oauth_expires_at, :datetime
  end
end
