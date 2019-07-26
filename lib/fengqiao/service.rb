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

    # 路由查询接口支持三种查询方式:
    # 根据通过丰桥接口下单的订单号查询,系统校验信息匹配将返回对应运单路由信息。
    # 根据运单号+月结卡号(需与传入的顾客编码绑定)查询,系统校验信息归属关系正确将返回对应运单路由信息。
    # 根据运单号+运单对应的收寄人任一方电话号码后4位(参数check_phoneNo中传入)查询,系统校验信息匹配将返回对应运单路由信息。

    # tracking_type	Number(2)	否	1	查询号类别:
    # 1:根据顺丰运单号查询,order节点中tracking_number将被当作顺丰运单号处理
    # 2:根据客户订单号查询,order节点中tracking_number将被当作客户订单号处理
    # 3:逆向单,根据客户原始订单号查询,order节点中tracking_number将被当作逆向单原始订单号处理

    # 2	tracking_number	String(4000)	是
    # 查询号:
    # 如果tracking_type=1,则此值为顺丰运单号
    # 如果tracking_type=2,则此值为客户订单号
    # 如果tracking_type=3,则此值为逆向单原始订单号
    # 如果有多个单号,以逗号分隔,如"123,124,125"。
    def route(tracking_type="1", tracking_number)
      package('RouteService', 'RouteRequest', 
        'tracking_type' => tracking_type,
        'tracking_number' => tracking_number
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
