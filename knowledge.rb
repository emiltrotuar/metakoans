def attribute arg
	if arg.is_a?(Hash)
		k = arg.keys[0]
		v = arg.values[0]
	  class_eval <<-AREADER
	  	def #{k}
	  	 @#{k}||=#{v}
	  	end
	  AREADER
	  class_eval <<-AWRITER
		  def #{k}=(v)
		   @#{k}=v
		  end
	  AWRITER
    class_eval <<-ACHECKER
	    def #{k}?
	     @#{k} ? true : false
	    end
    ACHECKER
	else
		class_eval <<-AREADER
	  	def #{arg}
	  	 @#{arg}
	  	end
	  AREADER
	  class_eval <<-AWRITER
		  def #{arg}=(v)
		   @#{arg}=v
		  end
	  AWRITER
    class_eval <<-ACHECKER
	    def #{arg}?
	     @#{arg} ? true : false
	    end
    ACHECKER
  end
end