class RenamePasswordDigestStringToPasswordDigest < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :password_digest_string, :password_digest
  end
end
