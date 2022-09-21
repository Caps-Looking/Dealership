# frozen_string_literal: true

class OrderByDirection < EnumerateIt::Base
  associate_values(
    :asc,
    :desc
  )

  sort_by :translation
end
