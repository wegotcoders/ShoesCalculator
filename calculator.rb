Shoes.app :title => "My Slightly Broken Calculator", :width => 200, :height => 240 do
  stack :margin => 55 do
    @output = edit_line width: 100

    
    flow do
      %w(9 8 7 6 5 4 3 2 1 0 + / * ( )- ).each do |op|      
        button op do         
          append op
        end
      end
      
      button "=" do
        eval_expression
      end

      button "c" do
        @input = ""
        @output.text = ""
      end

      button "^2" do
        append "**2"
      end

      button "sqrt" do

        # @inputInt  = @input.to_i
        # @sqrt = Math.sqrt(@inputInt)
        # @sqrtStr = @sqrt.to_s
        # @output.text = @sqrtStr

       @input = Math.sqrt(@input.to_i).to_s
       @output.text = @input
      end

      button "log2" do
       @input = Math.log2(@input.to_i).to_s
       @output.text = @input
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
    @input = eval(@input).to_s
    @output.text = @input
  end
  
end
