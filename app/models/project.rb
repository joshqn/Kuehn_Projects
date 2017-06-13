class Project < ApplicationRecord
  validates :title, :description, :projType, presence: true
  validates :projType, length: { maximum: 1 }

  has_attached_file :projImage, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :projImage, :content_type => /\Aimage\/.*\Z/

  def self.ios_projects
    return Project.where(:projType => 1)
  end

  def self.web_projects
    return Project.where(:projType => 0)
  end

end
