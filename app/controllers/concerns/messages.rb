module Messages
  def msg(val = nil)
    {
      not_found: "#{val} not found",
      error_occured: "Error occured",
      deleted: "#{val} deleted",
      limit_exceeded: "Maximum result per request is 100",
      successful: "#{val} successful",
      login_failed: "Email/Password Incorrect"
    }
  end
end