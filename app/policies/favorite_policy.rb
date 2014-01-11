class FavoritePolicty < ApplicationPolicy

    def create?
        user.present?
    end

end
