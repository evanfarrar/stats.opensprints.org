class CreateProfiles < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string  :city_state, :country, :website
      t.text    :upcoming_events, :description
      t.string  :profile_picture_file_name
      t.string  :profile_picture_content_type
      t.integer :profile_picture_file_size
    end
  end

  def self.down
    change_table :users do |t|
      t.remove :city_state
      t.remove :country
      t.remove :website
      t.remove :upcoming_events
      t.remove :description
      t.remove :profile_picture_file_name
      t.remove :profile_picture_content_type
      t.remove :profile_picture_file_size
    end
  end
end
