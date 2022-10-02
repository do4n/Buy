# properties default
%w(price quantity color size).each do |name|
  Property.create name: name
end