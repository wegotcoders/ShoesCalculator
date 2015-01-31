# encoding: UTF-8
Shoes.app :title => "My Amazing Calculator", :width => 189, :height => 240 do
  @back  = background black
  stack :margin => 10 do
    @back  = background black
    @output = edit_line width:166, margin:4
    
    flow do
      %w(7 8 9 + 4 5 6 - 1 2 3 ÷ 0 = C * ^ sqrt log2 mrtg).each do |op| 
        button op do  
          case op
            when "="
              eval_expression
            when "C"
              @output.text = nil
              @input = nil
            when "^"
              @input = @input.to_i**2
              @output.text = @input
            when "÷"
              append "/"
            when "sqrt"
              @input = Math.sqrt(@input.to_f).to_s
              @output.text = @input
            when "log2"
              @input = Math.log2(@input.to_i).to_s
              @output.text = @input
            when "mrtg"
              @input = @input.to_f/12
              @output.text = @input
            else       
              append op
          end
        end
      end
    end
  end

  def append(s)
    if @input.nil?
      @input = ""
    end
    @input += s
    @output.text = @input
  end

  def eval_expression
    string_arr = @input.split(/([\/*+\^-])/)
    string_arr.map! do |k|
      k.match(/[\/*+\^-]/) ? k : k.to_f
    end
    @input = string_arr.join
    @input = eval(@input)
    @output.text = @input
    @input = @input.to_s
  end
  

end