class AddFileType < ActiveRecord::Migration
  def change
    add_column :habits, :file_type, :string
  end
end
