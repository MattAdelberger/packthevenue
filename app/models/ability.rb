class Ability  
  include CanCan::Ability  
  
  def initialize(user)
    user || User.new # guest user
    can :read, :all
    can :manage,  Activity, :account_id => user.id
  end  
end  
