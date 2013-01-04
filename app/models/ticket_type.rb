class TicketType < ActiveRecord::Base
  attr_accessible :ticketname, :ticket_price, :max_price
  validates_presence_of :ticketname, :ticket_price, :max_price
  belongs_to :activity
end