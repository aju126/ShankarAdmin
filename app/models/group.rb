class Group < ActiveRecord::Base

  #associations

  has_and_belongs_to_many :customers
  belongs_to :package, :inverse_of => :groups

end
