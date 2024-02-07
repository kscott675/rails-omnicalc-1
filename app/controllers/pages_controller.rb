class PagesController < ApplicationController
  def home
    render "home"
  end

  def calculate
    @math = params[:math]
    case @math
    when "square"
      @title = "Square Results"
      @input = params[:user_number].to_f
      @squared_number = @input ** 2
      @output =
      "<dl>
        <dt>
          Number
        </dt>
        <dd>
          #{@input}
        </dd>
        <dt>
          Square
        </dt>
        <dd>
          #{@squared_number}
        </dd>
        </dl>"
      @outro = '<a href="/square/new">Calculate another square</a>'
      render "results"
    when "square_root"
      @title = "Square Root Results"
      @input = params[:user_number].to_f
      @squared_number = Math.sqrt(@input).to_f
      @output = "<dl>
      <dt>
        Number
      </dt>
      <dd>
        #{@input}
      </dd>
      <dt>
        Square
      </dt>
      <dd>
        #{@squared_number}
      </dd>
      </dl>"
      @outro = '<a href="/square_root/new">Calculate another square root</a>'
      render "results"
    when "payment"
      @title = "Payment Results"
      @apr = params[:apr].to_f / 100 / 12  # Convert APR to a monthly interest rate
      @number_of_years = params[:number_of_years].to_i * 12  # Convert years to months
      @principal = params[:principal].to_f

      numerator = @apr * (1 + @apr) ** @number_of_years
      denominator = ((1 + @apr) ** @number_of_years) - 1

      @monthly_payment = @principal * (numerator / denominator)

      @output = "<dl>
      <dt>
        APR
      </dt>
      <dd>
        #{(@apr * 12 * 100).to_f.to_s.to_f.to_fs(:percentage, precision: 4)}
      </dd>
    
      <dt>
        Number of years
      </dt>
      <dd>
        #{@number_of_years / 12}
      </dd>
    
      <dt>
        Principal
      </dt>
      <dd>
        #{@principal.to_f.to_s.to_f.to_fs(:currency)}
      </dd>
    
      <dt>
        Payment
      </dt>
      <dd>
        #{@monthly_payment.to_f.to_s.to_f.to_fs(:currency, precision: 2)}
      </dd>
    </dl>"

      @outro = '<a href="/payment/new">Calculate another payment</a>'
      render "results"
    when "random"
      @title = "Random Results"
      @min_input = params[:user_min].to_f
      @max_input = params[:user_max].to_f
      @random_number = rand(@min_input..@max_input)
      @output = "<dl>
  <dt>Minimum</dt>
  <dd>#{@min_input}</dd>
ˇ
  <dt>Maximum</dt>
  <dd>#{@max_input}</dd>

  <dt>Random Number</dt>
  <dd>#{@random_number}</dd>
</dl>"
      @outro = '<a href="/random/new">Pick another random number</a>'
      render "results"
    else
      @title = "Unknown method for #{@math}"
    end
  end

  def new
    @math = params[:math]
    
    render "#{@math}_new"
  end
end
