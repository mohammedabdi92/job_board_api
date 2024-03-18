# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new  # Guest user

    if user.admin?
      can :manage, JobPost
    else
      can :read, JobPost
      can :apply, JobPost
    end
  end
end
