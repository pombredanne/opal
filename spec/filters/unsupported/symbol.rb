opal_filter "Symbol" do
  fails "Numeric#coerce raises a TypeError when passed a Symbol"
  fails "Fixnum#coerce raises a TypeError when given an Object that does not respond to #to_f"
  fails "Symbol#to_proc produces a proc that always returns [[:rest]] for #parameters"
  fails "The throw keyword does not convert strings to a symbol"
  fails "Module#const_get raises a NameError if a Symbol has a toplevel scope qualifier"
  fails "Module#const_get raises a NameError if a Symbol is a scoped constant name"
  fails "A Symbol literal is a ':' followed by any number of valid characters"
  fails "A Symbol literal is a ':' followed by a single- or double-quoted string that may contain otherwise invalid characters"
  fails "A Symbol literal is converted to a literal, unquoted representation if the symbol contains only valid characters"
  fails "A Symbol literal can be created by the %s-delimited expression"
  fails "A Symbol literal can contain null in the string"
  fails "A Symbol literal can be an empty string"
  fails "Marshal.dump with a Symbol dumps a Symbol"
  fails "Marshal.dump with a Symbol dumps a big Symbol"
  fails "Marshal.dump with a Symbol dumps an encoded Symbol"
  fails "Marshal.dump with a Symbol dumps a binary encoded Symbol"
  fails "Marshal.dump with an Array dumps a non-empty Array" # this particular spec dumps a Symbol, spec with String instead of Symbol is in spec/opal/
end
