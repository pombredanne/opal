require File.expand_path('../../../spec_helper', __FILE__)
require File.expand_path('../fixtures/classes', __FILE__)

describe "Native#method_missing" do
  before do
    @obj = NativeSpecs::OBJ
  end

  describe "accessing a null/undefined property" do
    it "returns nil" do
      @obj.doesnt_exist.should == nil
    end
  end

  describe "with a mid ending with '='" do
    it "sets the value on the property" do
      @obj.set_property = 100
      @obj.set_property.should == 100

      @obj.set_property = [1, 2, 3]
      @obj.set_property.should == [1, 2, 3]
    end
  end

  describe "accessing a property" do
    it "returns values from the native object" do
      @obj.property.should == 42
    end

    it "returns an array without wrapping" do
      @obj.array.should == [1, 2, 3, 4]
    end

  end

  describe "accessing a function property" do
    it "forwards methods to wrapped object as native function calls" do
      @obj.simple.should == "foo"
    end

    it "calls functions with native object as context" do
      @obj.context_check.should be_true
    end

    it "passes each argument to native function" do
      @obj.check_args(1, 2, 3).should == [1, 2, 3]
    end

    it "tries to convert each argument with to_native if defined" do
      obj, obj2, obj3 = Object.new, Object.new, Object.new
      def obj.to_native; "foo"; end
      def obj2.to_native; 42; end

      @obj.check_args(obj, obj2, obj3).should == ["foo", 42, obj3]
    end
  end
end
