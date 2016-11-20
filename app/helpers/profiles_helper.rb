module ProfilesHelper
  def relationship_options
    [['Single'],
     ['In a Relationship'],
     ['Complicated'],
     ['Married'],
     ['Divorced']]
  end

  def friendship_status_button
    if current_user.friends?(@user) || current_user.inverse_friends?(@user)
      'unfriend'
    elsif current_user.request_from?(@user)
      'accept_request'
    elsif current_user.already_requested?(@user)
      'cancel_request'
    else
      'friend_request'
    end
  end
end
