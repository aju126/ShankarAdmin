class Customer < ActiveRecord::Base

  # Validations
  validates_presence_of :first_name, :mobile, :set_defaults
  validates_uniqueness_of :mobile
  validates_uniqueness_of :email, unless: Proc.new{|f| f.email? }

  # Associations
  has_and_belongs_to_many :identities

  def set_defaults
    self.email = self.email.blank? ? 'Not Available': self.email
  end

  def email?
    self.email == 'Not Available'
  end


  def name
    self.first_name
  end
end
