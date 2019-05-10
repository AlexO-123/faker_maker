module FakerMaker
  # Proxy for mapping attribute names
  class DefinitionProxy
    def initialize(factory)
      @factory = factory
    end

    def method_missing(name, *args, &block) # rubocop:disable Style/MethodMissingSuper
      attribute = FakerMaker::Attribute.new name, block, *args
      @factory.attach_attribute attribute
    end
    
    def respond_to_missing?(method_name, include_private = false)
      super
    end
  end
end
