Shoes.app :title => "Richard's Calculator", :width => 150, :height => 240 do
  stack :margin => 10 do
    background black
    @output = edit_line width: 90

    flow :width => 105 do
      %w(7 8 9 4 5 6 1 2 3 0 + / * - = % c sqrt lg2).each do |op|
              button op do
                case op
                  when "="
                    eval_expression
                  when "c"
                    @input = ""
                    @output.text = ""
                  when "^2"
                    append "**2"
                  when "lg2"
                    @input = Math.log2(@input.to_f).to_s
                    @input.sub!(/.[0*]+/, "")
                    @output.text = @input
                    when "sqrt"
                    @input = Math.sqrt(@input.to_f).to_s
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
    @input = eval(@input).to_s
    @output.text = @input
  end

end
