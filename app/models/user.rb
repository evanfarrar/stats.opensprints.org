class User < ActiveRecord::Base
  include Clearance::User
  has_attached_file :profile_picture,
    :styles => {:large => "500x500>", :medium => "300x300>", :small => "100x100>"}

  validates_presence_of :group_name
  attr_accessible :group_name
  attr_accessible :upcoming_events
  attr_accessible :country
  attr_accessible :city_state
  attr_accessible :website
  attr_accessible :description
  attr_accessible :profile_picture

  has_many :config_files
  has_many :data_uploads

  def before_save
    self.group_name_for_url = self.group_name.parameterize
  end

  def tournaments
    data_uploads.last.tournaments
  end

  def get_event(id)
    data_uploads.last.get_event(id)
  end

end
