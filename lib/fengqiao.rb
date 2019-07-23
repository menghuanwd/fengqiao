require "fengqiao/version"
require "fengqiao/request"
require "fengqiao/service"

module Fengqiao
  class Error < StandardError; end
  # Your code goes here...

  SEND_GATEWAY = 'https://bsp-oisp.sf-express.com/bsp-oisp/sfexpressService'

  class << self
    attr_accessor :code, :check_word, :custid
  end
end
