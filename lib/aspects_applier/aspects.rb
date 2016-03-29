require 'thread_safe'

module AspectsApplier
	module Aspects
		def self.included(klass)
			klass.extend(ClassMethods)
		end

		module ClassMethods
			def has_class_extensions(*args)
				@@_aspects = ::ThreadSafe::Array.new(args.map(&:to_s))
			end

			def all_aspects
				@@_aspects
			end

			def inherited(klass)
				klass.class_eval {include ::AspectsApplier::AspectsApplier}
				super
			end				
		end
	end
end
