class Activity < ActiveRecord::Base
  attr_accessible :address, :city, :description, :end, :latitude, :longitude, :name, :photo, :category,
  :start, :state, :zip, :ticket_types_attributes, :location_description, :min_capacity, :reduced_ticket, 
  :starting_ticket, :include_fee, :max_capacity, :final_price, :status
  belongs_to :account
  has_many :payments, :dependent => :destroy
  
  validates_presence_of :name, :description, :start, :end, :address, :city, :zip
 
  acts_as_followable
  
  has_many :ticket_types, :dependent => :destroy
  
  accepts_nested_attributes_for :ticket_types, :allow_destroy => true

	acts_as_gmappable
	
	def gmaps4rails_address
	  "#{self.address}, #{self.city}, #{self.state}" 
	end
	
  has_attached_file :photo, :styles => { :large => "670x392", :medium => "362x400", :thumb => "100x100>" }
end
