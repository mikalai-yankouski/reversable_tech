require "reversable_tech/version"

module ReversableTech
  class Reverter
    AVAILABLE_ENTITIES = {
      String => [:reverse],
      Array => [:reverse],
      Hash => [:to_a, :reverse, :to_h]
    }

    def initialize(entity)
      @entity = entity
    end

    def call
      AVAILABLE_ENTITIES[@entity.class].inject(@entity){|entity, method| entity.__send__(method) }
    end
  end
end
