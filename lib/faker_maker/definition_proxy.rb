module FakerMaker
  class DefinitionProxy
    attr_reader :klass

    def initialize factory
      @factory = factory
    end

    def method_missing name, *args, &block
      attribute = FakerMaker::Attribute.new name, *args, block
      @factory.attach_attribute attribute
    end

  end
end