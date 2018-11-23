class SupClass
  def metaclass
    class << self; self; end
  end
end

class TestClass < SupClass
  def self.resource_url
    name
  end
end

p SupClass.new.metaclass
p TestClass.new.metaclass
p TestClass.resource_url
