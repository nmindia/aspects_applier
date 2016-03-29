module TestAspect
	class TestChildClass 
		def self.bind_class(klass)
			klass.define_singleton_method(:method_defined_in_aspect, proc {true}) 
		end
	end
end
