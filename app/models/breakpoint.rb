class Breakpoint < ActiveRecord::Base
  attr_accessible :discount, :number
  belongs_to :activity
end
