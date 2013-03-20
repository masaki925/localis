module Mercury
  module Authentication

    def can_edit?
      # current_user.has_role? :admin
      true
    end

  end
end