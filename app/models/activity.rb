class Activity < ActiveRecord::Base
  attr_accessible :address, :city, :description, :end, :latitude, :longitude, :name, :private, :photo,
  :start, :state, :zip, :min, :max, :ticket_types_attributes, :breakpoints_attributes
  belongs_to :account
  validates_presence_of :address, :city, :description, :name, :zip
 
  acts_as_followable
  
  has_many :ticket_types, :dependent => :destroy
  has_many :breakpoints, :dependent => :destroy
  
  accepts_nested_attributes_for :ticket_types, :breakpoints, :allow_destroy => true

	acts_as_gmappable
	
	def gmaps4rails_address
	  "#{self.address}, #{self.city}, #{self.state}" 
	end
	
  has_attached_file :photo, :styles => { :large => "670x392", :medium => "362x400#", :thumb => "100x100>" }
end
