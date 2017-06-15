class Project < ApplicationRecord
  validates :title, :description, :projType, presence: true
  validates :projType, length: { maximum: 1 }
  attr_accessor :full_title


  has_attached_file :projImage,
  :default_url => "https://s3.us-east-2.amazonaws.com/kuehnprojects/projects/projimages/000/000/025/original/iTunesArtwork_2x.png",
  styles: {
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

  def full_title
    type = self.projType == 0 ? "iOS" : "Web"
    return "#{self.title} | #{type}"
  end

end
