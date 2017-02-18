# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  text       :string
#  book_id    :integer          not null
#  author_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_comments_on_author_id  (author_id)
#  index_comments_on_book_id    (book_id)
#

FactoryGirl.define do
  factory :comment do
    text "MyString"
book nil
user nil
  end

end
