shared_examples_for "An ActiveModel" do
  def assert(test, *args)
    expect(test).to eq(true)
  end

  def assert_equal(test, obj)
    expect(test).to eq(obj)
  end

  def assert_kind_of(klass, inspected_object)
    expect(inspected_object).to be_kind_of(klass)
  end

  def assert_respond_to(obj, meth, msg = nil)
    expect(obj).to respond_to meth
  end

  include ActiveModel::Lint::Tests

  ActiveModel::Lint::Tests.public_instance_methods.map{|m| m.to_s}.grep(/^test/).each do |m|
    example m.gsub('_',' ') do
      send m
    end
  end

  def model
    subject
  end

end
