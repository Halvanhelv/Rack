# frozen_string_literal: true

require_relative 'middleware/runtime'
require_relative 'middleware/logger'
require_relative 'app'
use Runtime
use AppLogger
run App.new # Rack::Handler::WEBrick.run app не нужно писать, rack сам выберет сервер который установлен
