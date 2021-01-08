module SessionHelper
    def signed_in?
        !current_user.nil?
    end

    def sign_out
        cookies.signed[:user_id] = nil
        self.current_user = nil
    end

    def current_user=(user)
        @current_user = user
    end

    def current_user
        @current_user ||= User.find_by(id: cookies.signed[:user_id])
    end

    def sign_in(user)
        cookies.signed[:user_id] = { value: user.id, expires: 15.days }
        user[:last_login_at] = DateTime.now
        user.save
        self.current_user = user
    end
end
