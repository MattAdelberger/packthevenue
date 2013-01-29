class Payment < ActiveRecord::Base
  attr_accessible :status, :quantity
  validates_presence_of :status, :quantity
  
    belongs_to :account
    belongs_to :activity
end
