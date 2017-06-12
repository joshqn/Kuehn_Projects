class AddProjImageToProjects < ActiveRecord::Migration[5.1]
  def self.up
    add_attachment :projects, :projImage
  end

  def self.down
    remove_attachment :projects, :projImage
  end
end
