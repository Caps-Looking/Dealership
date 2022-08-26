# frozen_string_literal: true

class Fuel < EnumerateIt::Base
  associate_values(
    ethanol: 1,
    gasoline: 2,
    diesel: 3,
    electric: 4,
    hybrid: 5
  )

  sort_by :translation
end
