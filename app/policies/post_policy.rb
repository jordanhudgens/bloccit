class PostPolicy < ApplicationPolicy

    def create?
        user.present?
    end
    
    def update?
        user.present? && (user.role?(:admin) || record.user == user)
    end

    def destroy?
        user.present? && (user.role?(:admin) || user.role?(:moderator) || record.user == user)
    end

    def my_edit?
        update?
    end
end
