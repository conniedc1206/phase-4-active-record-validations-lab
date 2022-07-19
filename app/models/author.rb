class Author < ApplicationRecord
    # All authors have a name/is expected to validate that :name cannot be empty/falsy
    # is expected to validate that :name is case-sensitively unique
    validates :name, presence: true, uniqueness: true
    # is expected to validate that the length of :phone_number is 10
    validates :phone_number, length: {is: 10}
end
