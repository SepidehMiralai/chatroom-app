class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :user_name, presence: true
  has_many :rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
       
  def persist_messages!(user_messages)
    # Group user_messages by room_id
    # {
    #   1=>[{:created_at=>512748132781, :content=>"Hello everyone!!!", :room_id=>1}],
    #   2=>[{:created_at=>512748132781, :content=>"Hello everyone!!!", :room_id=>2}],
    #   3=>[{:created_at=>512748132781, :content=>"Hello everyone!!!", :room_id=>3}]
    # }
    user_messages.group_by { |m| m[:room_id] }.each do |room_id, room_messages|
      Room.find(room_id).persist_messages_for_user!(room_messages, self)
    end
  end
end
