class Chat < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"

  has_many :messages, dependent: :destroy

  scope :for_user, ->(user) {
    where("sender_id = :id OR receiver_id = :id", id: user.id)
  }

  validates :sender_id, presence: true
  validates :receiver_id, presence: true
  validate :sender_and_receiver_are_different
  
  def other_participant(current_user)
    sender_id == current_user.id ? receiver : sender
  end
  
  private

  def sender_and_receiver_are_different
    errors.add(:receiver_id, "must be different from sender") if sender_id == receiver_id
  end
end
