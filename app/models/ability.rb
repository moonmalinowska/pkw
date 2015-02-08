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
      can [:index, :show],  Voivodship#, :id => user.id
      can [:index, :show], District#, :voivodship_id => voivodship.id
      can [:index, :show], Commitee
      cannot [:edit, :update], Commitee
      cannot :create, [User, Voivodship, Commitee]
      cannot :index, User
      cannot :destroy, :all
    elsif user.role == "Okręgowy"
      can :show, User, :id => user.id
      can [:index, :show], District, :user_id => user.id
      can [:edit, :update], District, :user_id => user.id
      can  :edit, @district, :user_id => user.id
      #cannot :update, District, District.electorate do |electorate|
      #  @district.electorate
      #end
      #cannot :update, District, District.mandate
      can [:show, :update, :edit, :index], Vote #, :commitee_id => commitee.id    źle?! index niby wyrzucić, bo do wszystkich show/edit
      can [:index, :update, :show], Commitee
      cannot :edit, Commitee
      can :show, @commitee
      cannot :destroy, :all
      cannot :create, [User, District, Commitee]
      cannot :manage, Voivodship
     #elsif user.role.nil?
      # cannot :manage, [Vote, District, Voivodship, Commitee]

  end



  end


end
