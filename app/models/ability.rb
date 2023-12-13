# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    
    can :read, Hotel, :all
    can :read, Room, :all
    can :read, City, :all
    can :read, State, :all
    can :read, Country, :all
    can :read, HotelLocation, :all
    can :read, HotelType, :all
    #can :read, RoomOption
    can :all, FilterController
    can :all, RoomsController
    
    can :read, RoomOption
    return unless user.present?
    
    can :all, PaymentsController

    if user.user_hotel?
      can [:read, :create, :update, :delete], Hotel
      can :all, HotelsController
      can :all, RoomOptionsController
      can :all, RoomOption
    end

    return unless user.admin?
    
    can :manage, :all
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
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
