class GravePolicy < ApplicationPolicy
  def create?
    # !user.guest?
    user.present?
  end

  def update?
    # user.admin_role? || user.moderator_role? || user.author?(record)
    user&.admin_role? || user&.moderator_role? || user&.author?(record)
  end

  def destroy?
    user&.admin_role? || user&.author?(record)
  end
end
