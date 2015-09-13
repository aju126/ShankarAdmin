class AddAttachmentDocumentToIdentities < ActiveRecord::Migration
  def self.up
    change_table :identities do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :identities, :document
  end
end
