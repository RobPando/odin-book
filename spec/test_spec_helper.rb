module TestHelpers
  def log_in(user, remember_me = '0')
    post user_session_path, params: { user: { email: user.email,
                                              password: user.password,
                                              remember_me: remember_me } }
  end
end
