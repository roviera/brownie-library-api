# == Schema Information
#
# Table name: requests
#
#  id         :integer          not null, primary key
#  status     :integer
#  user_id    :integer
#  book_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_requests_on_book_id  (book_id)
#  index_requests_on_user_id  (user_id)
#

class Request < ApplicationRecord
  belongs_to :user
  belongs_to :book

  enum status: [:denied, :approved, :pending]

  scope :denied, -> { where(status: 0) }
  scope :approved, -> { where(status: 1) }
  scope :pending, -> { where(status: 2) }
end
