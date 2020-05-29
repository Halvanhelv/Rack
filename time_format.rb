# frozen_string_literal: true

class TimeFormat
  attr_reader :invalid_params
  FORMAT = { year: '%Y', month: '%m', day: '%d', hour: ' %H:', minute: '%M', second: '%S' }.freeze
  def initialize(params)
    @params = params.split(',')
    @invalid_params = @params - FORMAT.keys.map(&:to_s)
  end

  def result
    Time.now.strftime(call) + "\n"
  end

  def call

    result = []
    @params.each { |e| result << FORMAT[e.to_sym] }
    result.join('-')
  end
end
