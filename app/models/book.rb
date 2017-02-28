# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  title      :string
#  year       :integer
#  ISBN       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Book < ApplicationRecord
#  belongs_to :author
#  has_many :comments
#  has_many :requests
#  has_many :users, through: :requests
end
