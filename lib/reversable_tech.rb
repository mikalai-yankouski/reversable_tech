# frozen_string_literal: true

module ReversableTech
  class Reverter
    AVAILABLE_ENTITIES = {
      String => [:reverse],
      Array => [:reverse],
      Hash => %i[to_a reverse to_h]
    }.freeze

    def initialize(entity)
      @entity = entity
    end

    def call
      AVAILABLE_ENTITIES[@entity.class].inject(@entity) { |entity, method| entity.__send__(method) }
    end
  end
end
