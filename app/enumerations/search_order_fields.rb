# frozen_string_literal: true

class SearchOrderFields < EnumerateIt::Base
  associate_values(
    :name,
    :brand,
    :model,
    :version,
    :color,
    :price,
    :mileage,
    :store
  )

  sort_by :translation
end
