class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #

    alias_action :create, :read, :update, :destroy, :to => :crud

    user ||= User.new # guest user (not logged in)
    can :create, Schooldistrict
    can :read, Schooldistrict
    can :create, School
    can :read, School
    if user.superadmin?
      can :manage, :all
    elsif user.admin?
      can :crud, [Student, Classroom, Studentdatum]
      can :create, [School, Schooldistrict]
      can :read, [School, Schooldistrict]
      can :update, [School, Schooldistrict]
    elsif user.teacher?
      can :crud, [Classroom]
      can :create, [Studentdatum, Student]
      can :read, [School, Student, Studentdatum, Schooldistrict]
      can :show, [School, Student, Studentdatum, Schooldistrict]
      can :update, [Studentdatum, Student]
    end

    #
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
