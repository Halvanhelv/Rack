# frozen_string_literal: true

class TimeFormat
  FORMAT = { year: '%Y', month: '%m', day: '%d', hour: ' %H:', minute: '%M', second: '%S' }.freeze
  def initialize(params)
    @params = params.split(',')

  end

  def invalid_params
    @invalid_params = @params - FORMAT.keys.map(&:to_s)
  end

  def result
    Time.now.strftime(call) + "\n"
  end

  def call
    invalid_params
    @result = []
    @params.each { |e| @result << FORMAT[e.to_sym] }
    @result.join('-')
  end

  def valid?
    if @invalid_params.empty?
      true
    else
      false
    end
  end
end
