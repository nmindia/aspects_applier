The aspect applier can be used to add aspects to instances/classes outside the main class in order to keep code clean.
For eg: stuff like logging, notfications, authorization logic should not be allowed to clutter your main business logic defined in the model class. It is with this philosophy that this small utility has been written.

In order to use it:

class TestParentClass
  
  include AspectsApplier::Aspects
  
  has_class_extensions :test_aspect

end

Now, in all classes inheriting from TestParentClass, aspects applier would try to find a particularly named class and then call it's bind_class method passing it the class object, thereby allowing aspects to be applied dynamically.

Thus for a TestChildClass, it would look for TestAspect::TestChildClass 

module TestAspect

  class TestChildClass
  
    def self.bind_class(klass)
  
      klass.define_singleton_method(:method_defined_in_aspect, proc {true}) 
  
    end
  
  end

end

Please see specs for more details.
