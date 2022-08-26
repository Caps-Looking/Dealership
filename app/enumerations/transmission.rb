# frozen_string_literal: true

class Transmission < EnumerateIt::Base
  associate_values(
    at: 1,
    mt: 2
  )

  sort_by :translation
end
