# frozen_string_literal: true

class TimeFormat
  attr_reader :invalid_params
  FORMAT = { year: '%Y', month: '%m', day: '%d', hour: ' %H:', minute: '%M', second: '%S' }.freeze
  def initialize(params)
    @params = params.split(',')

  end

  def result
    Time.now.strftime(call) + "\n"
  end

  def call
    @invalid_params = @params - FORMAT.keys.map(&:to_s)
    result = []
    @params.each { |e| result << FORMAT[e.to_sym] }
    result.join('-')
  end

  def valid?
    if @invalid_params.empty?
      true
    else
      false
    end
  end
end
