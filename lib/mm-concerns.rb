module ConcernsPlugin
  module ClassMethods
    def concerned_with(*concerns)
      concerns.each do |concern|
        require_dependency "#{name.underscore}/#{concern}"
      end
    end
  end
  module InstanceMethods
    def concerned_with(*concerns)
      self.class.concerned_with(concerns)
    end
  end
end

module ConcernsPluginAddition
  def self.included(model)
    model.plugin ConcernsPlugin
  end
end

MongoMapper::Document.append_inclusions(ConcernsPluginAddition)
MongoMapper::EmbeddedDocument.append_inclusions(ConcernsPluginAddition)