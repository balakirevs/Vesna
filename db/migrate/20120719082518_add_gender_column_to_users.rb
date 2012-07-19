class AddGenderColumnToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :gender, :string, :default => 'M'
  end
end
