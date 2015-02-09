class AddAttachmentToCommitees < ActiveRecord::Migration
  def change
    add_attachment :commitees, :logo
  end
end
