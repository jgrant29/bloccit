class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def destroy?
    user.present? && (record.user == user || user.admin? || user.moderator? || user.guest?)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin? || user.moderator?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

end
