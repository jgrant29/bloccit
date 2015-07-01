class PostPolicy < ApplicationPolicy
  def index?
    true
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
        flash[:error] = "There was an error saving the post. Please try again."
       render :edit
      end
    end

  end

end