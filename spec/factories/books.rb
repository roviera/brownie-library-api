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

FactoryGirl.define do
  factory :book do
    title "MyString"
year 1
ISBN "MyString"
  end

end
