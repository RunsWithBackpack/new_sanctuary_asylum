class Accompaniment < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  validates :activity_id, :user_id, presence: true

  def self.find_or_build(activity, user)
    if user.attending?(activity)
      Accompaniment.where(user_id: user.id, activity_id: activity.id).first
    else
      user.accompaniments.new(activity_id: activity.id)
    end
  end
end
