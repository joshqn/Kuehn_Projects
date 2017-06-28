class Project < ApplicationRecord
  validates :title, :description, :projType, presence: true
  validates :projType, length: { maximum: 1 }
  before_save :nil_if_blank, :check_for_proper_uri
  attr_accessor :full_title


  has_attached_file :projImage,
  :default_url => "https://s3.us-east-2.amazonaws.com/kuehnprojects/projects/projimages/000/000/025/medium/iTunesArtwork_2x.png",
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

  private

    def nil_if_blank
      if self.proj_link.blank?
        self.proj_link = nil
      end
    end

    def check_for_proper_uri
      if self.proj_link != nil && URI.parse(self.proj_link).scheme == nil
        self.proj_link = "http://" + self.proj_link
      end
    end

end
