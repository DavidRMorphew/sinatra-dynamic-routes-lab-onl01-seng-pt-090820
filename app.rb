require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!
  get '/' do
    "This does work, right?"
  end

  get '/reversename/:name' do
    @name = params[:name]
    "#{@name.reverse}"
  end

  get '/square/:number' do
    @number = params[:number].to_i
    "#{@number**2}"
  end

  get '/say/:number/:phrase' do
    @number = params[:number].to_i
    @phrase = params[:phrase]
    Array.new(@number, @phrase).join(" ")
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    # This sets all of the instance variables and outputs what I want:
    params.map do |k,v|
      instance_variable_set("@#{k}",v)
    end.join(" ")+"."
  end

  get '/:operation/:number1/:number2' do
    params.map do |k,v|
      instance_variable_set("@#{k}",v)
    end
    operation_str_symbol = {"add" => "+", "subtract" => "-", "multiply" => "*", "divide" => "/"}
    final_num = (@number1.to_i).send operation_str_symbol[@operation], (@number2.to_i)
    final_num.to_s
  end
end