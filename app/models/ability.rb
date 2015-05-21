class Ability
  include CanCan::Ability

  def initialize(user)
    # Set guest role if not logged in
    user ||= User.new(role: "guest")
    
    if user.has_role? :agency_owner
      can :manage, :all
      # can [:create, :read, :update ], User, :profile_id => user.profile_id
      # can [:read, :update, :add_user ], AgencyProfile, 
      #     AgencyProfile do |agency_profile|
      #       agency_profile.users.include?(user)
      #     end
      # can :manage, JobOrder, JobOrder.active do |job_order|
      #       job_order.agency_profile_id == user.profile_id
      # end
      # can :manage, Assignment, :job_order => { :agency_profile_id => user.profile_id }
      # # can :manage, Assignment, :job_order => { :agency_profile_id => user.profile_id }

      # can :create, CompanyProfile

    end
    
    # if user.has_role? :account_manager
    #   can :read, User, :profile_id => user.profile_id
    #   can [:create, :read, :update ], AgencyProfile, 
    #       AgencyProfile do |agency_profile|
    #         agency_profile.users.include?(user)
    #   end
    #   can [:create, :read, :update ], JobOrder, 
    #       JobOrder do |job_order|
    #         job_order.try(:account_manager) == user
    #   end

    # end
    
    # if user.has_role? :employee

    # end


 
    
    # if user.agency_owner?
    #   can :manage, User, :profile => { :id => user.profile_id }
    # end 
      
  # can :read, AgencyProfile
   
    
    # can [ :create ], TimeReport do |time_report|
    # user.project_ids.include? time_report.project_id 

      #   profile = user.profile
      # can :manage, JobOrder, :agency_profile => { :profile_id => profile.id }
      # can :manage, AgencyProfile, :id => profile.id
    #   can :manage, User, :id => user.id
    #   can :manage, Assignment, :job_order => { :company_profile_id => profile.id }
    #   can :manage, Shift
    # end
    # if user.company?
      # can :manage, CompanyProfile, :id => user.profile_id
    #   can :manage, User, :id => user.id
    #   can :manage, Assignment, :job_order => { :company_profile_id => profile.id }
    #   can :manage, Shift
    # end
    # if user.employee?
    #   can :read, EmployeeProfile, :id => profile.id
    #   can :manage, Assignment, employee_profile_id: profile.id 
    #   can :manage, Shift, :assignment => { :employee_profile_id => profile.id }
    #   cannot :destroy, Shift
      
    # end
    
    
    
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
