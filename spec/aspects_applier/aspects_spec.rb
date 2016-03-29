aspects_test_dir = File.join(File.dirname(__FILE__), "test_classes")

describe "Aspects" do
	before(:all) do
		$LOAD_PATH << aspects_test_dir
	end

	after(:all) do
		$LOAD_PATH.delete aspects_test_dir
	end

	require 'aspects_applier/aspects'
	require 'aspects_applier/aspects_applier'


	it "should install the Aspect modules" do
		expect(AspectsApplier::Aspects.is_a?(Module)).to be true
		expect(AspectsApplier::AspectsApplier.is_a?(Module)).to be true
	end

	describe "it should load the aspects for child class" do
		before(:all) do
			require 'test_aspect/test_child_class'
			require 'test_parent_class'
			require 'test_child_class'
		end

		it "should not bind the aspect to the parent class" do
      expect(TestParentClass).to be_a Class
      expect(TestParentClass.ancestors.include?(AspectsApplier::Aspects)).to be true
      expect(TestParentClass.respond_to?(:has_class_extensions)).to be true
      expect(TestParentClass.respond_to?(:aspect_applied)).to be false
      expect(TestParentClass.respond_to?(:method_defined_in_aspect)).to be false
		end

		it "should bind the aspect to the child class" do
    	expect(TestChildClass).to be_a Class
    	expect(TestChildClass <= TestParentClass).to be true
    	expect(TestChildClass.aspect_applied?('test_aspect')).to be true
    	expect(TestChildClass.respond_to?(:method_defined_in_aspect)).to be true
    	expect(TestChildClass.send(:method_defined_in_aspect)).to be true
		end
	end
end