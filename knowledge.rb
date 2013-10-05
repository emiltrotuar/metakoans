def attribute arg, &block
	if arg.is_a?(Hash)
		k,v = arg.keys[0],arg.values[0]
  else
  	k,v = arg,0
  	define_method v=:v, &block if block_given?
  end
  class_eval <<-DEF
  	def #{k}; @#{k}||=#{v}; end
	  def #{k}=(v); @#{k}=v; end
    def #{k}?; @#{k}; end
  DEF
end
