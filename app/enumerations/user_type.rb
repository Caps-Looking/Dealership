# frozen_string_literal: true

class UserType < EnumerateIt::Base
  associate_values(
    admin: 1,
    store: 2
  )

  sort_by :translation
end
