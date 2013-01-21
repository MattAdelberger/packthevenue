class Account < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :type_of_user, :email, :password, :password_confirmation, :remember_me,:provider, :uid, :first_name, :last_name, :company_name, :zip_code
  # attr_accessible :title, :body
  
  devise :omniauthable
  
  acts_as_followable
  acts_as_follower
  
  validates_presence_of :first_name, :last_name
  validates :zip_code, :numericality => { :only_integer => true }
  
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    account = Account.where(:provider => auth.provider, :uid => auth.uid).first
    unless account
      account = Account.create(name:auth.extra.raw_info.name,
                           provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email,
                           password:Devise.friendly_token[0,20]
                           )
    end
    account
  end
  
  def self.new_with_session(params, session)
    super.tap do |account|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        account.email = data["email"] if account.email.blank?
      end
    end
  end
end
