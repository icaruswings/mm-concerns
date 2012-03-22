module ConcernsPlugin
  extend ActiveSupport::Concern
  
  module ClassMethods
    def concerned_with(*concerns)
      concerns.each do |concern|
        require_dependency "#{name.underscore}/#{concern}"
      end
    end
  end
  
  def concerned_with(*concerns)
    self.class.concerned_with(concerns)
  end
end

MongoMapper::Document.plugin(ConcernsPlugin)
MongoMapper::EmbeddedDocument.plugin(ConcernsPlugin)