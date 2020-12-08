class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  validates :title, presence: true
  scope :latest, -> { order(created_at: :desc)}
 


  def persist_messages_for_user!(user_messages, user)
    last_saved_message = messages.for_user(user).latest.first

    user_messages.select! { |m| m[:created_at] > last_saved_message.created_at.to_i} if last_saved_message

    user_messages.each do |message|
      messages.create!(message.merge(user: user))
    end
  end
end
