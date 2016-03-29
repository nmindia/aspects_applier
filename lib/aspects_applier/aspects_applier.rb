require 'thread_safe'

module AspectsApplier
  module AspectsApplier
    def self.included(klass)
      klass.extend(ClassMethods)
      klass.apply_all_aspects
    end

    module ClassMethods
      def apply_all_aspects()
        all_aspects.each do |aspect|
          apply_aspect(aspect) unless aspect_applied?(aspect)
        end
      end

      def aspect_applied?(aspect_name)
        !!(applied_aspects[aspect_name] rescue false)
      end

      def apply_aspect(aspect_name)
        return if aspect_applied?(aspect_name)
        aspect_class_obj = begin
          eval("::#{aspect_class_name(aspect_name)}") rescue nil
        rescue
          nil
        end
        mark_aspect_as_applied(aspect_name) if aspect_class_obj && (aspect_class_obj.bind_class(self) rescue nil)
      end

      def mark_aspect_as_applied (aspect_name)
        applied_aspects[aspect_name] = true 
      end

      def applied_aspects
        @applied_aspects ||= ::ThreadSafe::Hash.new
      end

      def aspect_class_name(aspect_name)
        self.name.split('::').insert(-2, aspect_name.split("_").each {|s| s.capitalize! }.join("")).join('::')
      end
    end
  end
end
