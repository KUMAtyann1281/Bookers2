class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy

  validates :name,
    length: { minimum: 2, maximum: 20 }

  validates :introduction,
    length: { minimum: 0, maximum: 50 }
    
  validates :email, uniqueness: true

  has_one_attached :profile_image

  private
  def User_params
    params.require(:User).permit(:name, :introduction, :profile_image)
  end
end

