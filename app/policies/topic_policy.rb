class TopicPolicy < ApplicationPolicy
    def create?
        user.present? && user.role?(:admin)
    end

    def update?
        user.present? && user.role?(:admin)
    end

    def destroy?
        user.present? && user.role?(:admin)
    end

    def public?
        Topic.all.visible_to(user)
    end
end
