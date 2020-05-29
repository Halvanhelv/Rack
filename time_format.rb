# frozen_string_literal: true

class TimeFormat
  attr_reader :invalid_params,:result
  FORMAT = { year: 'year', month: 'month', day: 'day', hour: 'hour', min: 'minute', second: 'sec' }.freeze
  def initialize(params)
    @params = params.split(',')

  end


  def call
    @invalid_params = @params - FORMAT.keys.map(&:to_s)
    @result = []
    @params.each { |e| result << Time.now.send(FORMAT[e.to_sym])  }
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
