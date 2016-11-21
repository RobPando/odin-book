module UsersHelper
  def established_friendship(other_user)
    if current_user.friends.include?(other_user)
      find_friendship(other_user.id)
    else
      find_inversefriendship(other_user.id)
    end
  end

  def find_friendship(other_user_id)
    current_user.friendships.find_by(friend_id: other_user_id)
  end

  def find_inversefriendship(other_user_id)
    current_user.inverse_friendships.find_by(user_id: other_user_id)
  end

  def owner?(user)
    current_user == user
  end
end
