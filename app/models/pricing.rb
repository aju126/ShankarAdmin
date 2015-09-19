class Pricing < ActiveRecord::Base

  # Associations
  belongs_to :package
  has_one :pricing_name#, :dependent => :destroy

  # # for nested fields: (natural choice for a has_one association)
  #
  #attr_accessible :pricing_name_attributes
  #accepts_nested_attributes_for :pricing_name, :allow_destroy => true

  # or if you want a dropdown select:

  #attr_accessible :pricing_name_id

  # Since ActiveRecord does not create setters/getters for has_one associations (why is beyond me), diy:
  def pricing_name_id
    self.pricing_name_id.try :id
  end
  def pricing_name_id_id=(id)
    self.pricing_name = PricingName.find_by_id(id)
  end
  def all_pricing_types
    all_types = PricingName.all.map{ |pricing| [pricing.name, pricing] }
    #raise all_types.inspect
  end

end
