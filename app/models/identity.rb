class Identity < ActiveRecord::Base

  has_attached_file :document,
                    :styles => {
                        :thumb => "100x100#",
                        :small  => "150x150>",
                        :medium => "200x200" }
                    #:path => ":rails_root/uploads/:class/:id/:basename.:extension"
  validates_attachment_content_type :document, :content_type => /\Aimage\/.*\Z/
  # add a delete_<asset_name> method:
  attr_accessor :delete_document
  before_validation { self.document.clear if self.delete_document == '1' }

  #validate_attachment_presence :document

  #belongs_to :customer#, :inverse_of => :identities

end
