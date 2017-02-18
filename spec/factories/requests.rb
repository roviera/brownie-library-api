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

FactoryGirl.define do
  factory :request do
    status 1
user nil
book nil
  end

end
