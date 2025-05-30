class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :sent_chats, class_name: "Chat", foreign_key: "sender_id", dependent: :destroy
  has_many :received_chats, class_name: "Chat", foreign_key: "receiver_id", dependent: :destroy
  def chats
    Chat.where("sender_id = ? OR receiver_id = ?", id, id)
  end
  
  has_many :messages, dependent: :destroy

  validates :email, presence: true, uniqueness: true
end
