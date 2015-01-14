Shoes.app :title => "My Slightly Broken Calculator", :width => 160, :height => 240 do 
  background rgb(240, 100, 50)
  stack :margin => 30 do
    @output = edit_line width: 100

    flow :width => 105 do
      %w(log2 sqrt 7 8 9 ^2 4 5 6 % 1 2 3 + * 0 . - c =  ).each do |op|      
        button op do
          case op
          when "="
            eval_expression
            when "c" 
              @input = "0"
              @output.text = "0"
            when "^2"
              append "**2"
            when "sqrt"
              @input = Math.sqrt(@input.to_f).to_s
              @input.sub!(/.[0*]+/, "")
              @output.text = @input
            when "log2"
               @input = Math.log2(@input.to_f).to_s
               @input.sub!(/.[0*]+/, "")
               @output.text = @input
             when "%"
              append "/"
            else 
              append op
            end
          end
      end
    end
  end
  
  # Stick a string on the end of our input
  #
  def append(s)
    if @input.nil?
      @input = ""
    end
    @input += s
    @output.text = @input
  end
  
  # Evaluate the input we've got so far
  #
  def eval_expression
    @input = eval(@input.to_s).to_s
    #@input.sub!(/.[0*]+/, "")
    @output.text = @input
  end
  
end
