class Package < ActiveRecord::Base

  #associations
  has_many :groups
  has_many :products
  has_many :pricings
  has_one  :status

end
