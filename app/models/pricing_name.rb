class PricingName < ActiveRecord::Base
  before_validation :downcase_name


  # Validations

  validates_presence_of :name
  validates_uniqueness_of :name

  # Associations

  belongs_to :pricing

  def downcase_name
    self.name = self.name.downcase if self.name.present?
  end

end
