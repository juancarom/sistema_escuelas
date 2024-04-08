# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.roles.exists?(name: 'admin')
      can :manage, :all
    elsif user.roles.exists?(name: 'editor')
      can :read, :all
      can :create, :all
      can :update, :all
    else
      can :read, :all
    end
  end
end
