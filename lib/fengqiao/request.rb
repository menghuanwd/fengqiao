require 'rexml/document'
require 'digest'
require 'base64'
require 'faraday'

module Fengqiao
  class Request
    def initialize(req_xml)
      @req_xml = req_xml
    end

    def do
      str = @req_xml + Fengqiao.check_word

      verifyCode = Digest::MD5.base64digest(str)

      data = { xml: @req_xml, verifyCode: verifyCode }

      res = ::Faraday.new(url: SEND_GATEWAY).post do |req|
        req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
        req.body = data
      end

      REXML::Document.new res.body
    end
  end
end
