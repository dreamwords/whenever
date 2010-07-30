module Whenever
  class Job
    
    attr_accessor :at, :output_redirection, :raw_syntex
  
    def initialize(options = {})
      @options = options
      
      @at                      = options[:at]
      @output_redirection      = options.has_key?(:output) ? options[:output] : :not_set
      @options[:environment] ||= :production
      @options[:path]        ||= Whenever.path
      @raw_syntex         = options[:raw_syntex] || false
    end
  
    def output
      @options[:template].gsub(/:\w+/) do |key|
        @options[key.sub(':', '').to_sym]
      end
    end
    
  end
end