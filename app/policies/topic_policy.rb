class TopicPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    record.public? || user.present?
  end

  def create?
    user.present? || user.admin?
  end

  def update?
    create?
  end

  def destroy?
    user.present? && (record.user == user || user.admin? || user.moderator?)
end