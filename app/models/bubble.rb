class Bubble < ApplicationRecord
  belongs_to :creator, class_name: "User", default: -> { Current.user }

  has_many :comments, dependent: :destroy
  has_many :boosts, dependent: :destroy

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  has_many :assignments, dependent: :destroy
  has_many :assignees, through: :assignments, source: :user

  has_one_attached :image, dependent: :purge_later

  enum :color, %w[
    #BF1B1B #ED3F1C #ED8008 #7C956B
    #698F9C #3B4B59 #5D618F #3B3633 #67695E
  ].index_by(&:itself), suffix: true, default: "#698F9C"
end
