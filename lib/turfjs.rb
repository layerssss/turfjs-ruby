# frozen_string_literal: true

require 'execjs'
require 'active_support/core_ext/string/inflections'

module TurfJS
  class Error < StandardError; end
  def self.context
    @context ||=
      begin
        source = File.read(File.expand_path('turfjs-build.js', __dir__))
        ExecJS.compile(source)
      end
  end

  def self.turf_api_mapping
    @turf_api_mapping ||=
      context.call('turfAPIs').map do |name|
        [name.underscore.to_sym, name]
      end.to_h
  end

  def self.method_missing(method, *args)
    turf_api_name = turf_api_mapping[method]
    return super unless turf_api_name

    begin
      context.call("turf.#{turf_api_name}", *args)
    rescue ExecJS::ProgramError => e
      raise Error, e.message
    end
  end

  def self.respond_to_missing?(method, include_private = false)
    turf_api_mapping.keys.include?(method) || super
  end
end
