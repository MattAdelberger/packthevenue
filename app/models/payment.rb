class Payment < ActiveRecord::Base
  attr_accessible :status, :quantity, :uri
  validates_presence_of :status, :quantity, :uri
  
    belongs_to :account
    belongs_to :activity
end
