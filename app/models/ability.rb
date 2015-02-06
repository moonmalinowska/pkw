class Ability
  include CanCan::Ability

  def initialize(user)
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
     if user ||= User.new
       cannot :manage, [Vote, District, Voivodship, Commitee]
       can :create, User
end
    if user.role == "Centralny"
      can [:show], Voivodship, :id => user.id
      can [:index, :show], District#, :voivodship_id => voivodship.id
      cannot :create, User
      cannot :destroy, :all
    elsif user.role == "Okręgowy"
      can :show, User, :id => user.id
      can [:index, :show], District, :user_id => user.id
      can :update, District, :user_id => user.id
      can [:index, :show, :update], Vote, :commitee_id => user.id #, :commitee_id => commitee.id    źle?! index niby wyrzucić, bo do wszystkich show/edit
      can :index, Commitee
      cannot :destroy, :all
      cannot :create, User
      cannot :manage, Voivodship

    end


  end


end
