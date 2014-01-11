class VotePolicy < ApplicationPolicy

    def create?
        user.present?
    end

end
