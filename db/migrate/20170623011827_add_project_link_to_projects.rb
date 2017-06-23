class AddProjectLinkToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :proj_link, :string
  end
end
