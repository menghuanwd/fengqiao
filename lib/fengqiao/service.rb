module Fengqiao
  class Service
    def order(orderid, express_type, pay_method, j_company, j_contact, j_tel, j_address, d_company, d_address, d_contact, d_tel)
      package('OrderService', 'Order',
        'orderid' => orderid,
        'express_type' => express_type,
        'is_docall' => '1',
        'j_company' => j_company,
        'j_contact' => j_contact,
        'j_tel' => j_tel,
        'j_address' => j_address,
        'd_company' => d_company,
        'd_contact' => d_contact,
        'd_tel' => d_tel,
        'd_address' => d_address,
        'pay_method' => pay_method,
        'custid' => Fengqiao.custid
      )
    end

    def query_search(orderid)
      package('OrderSearchService', 'OrderSearch', 
        'orderid' => orderid
      )

    end

    def order_cancel(orderid)
      package('OrderConfirmService', 'OrderConfirm', 
        'orderid' => orderid, 
        'dealtype' => '2'
      )
    end

    def route(orderid)
      package('RouteService', 'RouteRequest', 
        'tracking_type' => '2',
        'method_type' => '1',
        'tracking_number' => orderid
      )
    end

    private

    def package(service, title, *args)
      doc = REXML::Document.new
      element = doc.add_element('Request', 'service' => service, 'lang' => 'zh-CN')
      head = element.add_element('Head')
      head.add_text Fengqiao.code
      body = element.add_element('Body')
      body.add_element(title, *args)
      
      Request.new(doc.to_s).do
    end
  end
end
