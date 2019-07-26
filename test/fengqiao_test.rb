require "test_helper"

class FengqiaoTest < Minitest::Test

  def setup
    Fengqiao.code = ''
    Fengqiao.check_word = ''
    Fengqiao.custid = ''
    @tracking_number = ''
    @err_tracking_number = ''
  end

  # <?xml version='1.0' encoding='UTF-8'?><Response service='RouteService'>
  # <Head>OK</Head>
  # <Body>
  # <RouteResponse mailno='SF1010575444025'>
  # <Route accept_address='上海市' accept_time='2019-07-26 11:25:59' opcode='54' remark='顺丰速运 已收取快件'/>
  # <Route accept_address='上海市' accept_time='2019-07-26 11:46:46' opcode='50' remark='顺丰速运 已收取快件'/>
  # <Route accept_address='上海市' accept_time='2019-07-26 13:01:08' opcode='30' remark='快件在【上海嘉定真源营业部】已装车,准备发往 【上海普陀千阳营业点】'/>
  # <Route accept_address='上海市' accept_time='2019-07-26 13:03:20' opcode='36' remark='快件已发车'/>
  # <Route accept_address='上海市' accept_time='2019-07-26 14:26:00' opcode='31' remark='快件到达 【上海虹桥同城集散点】'/>
  # <Route accept_address='上海市' accept_time='2019-07-26 14:26:00' opcode='30' remark='快件在【上海虹桥同城集散点】已装车,准备发往 【上海闵行同城集散点】'/>
  # <Route accept_address='上海市' accept_time='2019-07-26 14:41:19' opcode='36' remark='快件已发车'/>
  # </RouteResponse>
  # </Body>
  # </Response>
  def test_query_route
    res_doc = Fengqiao::Service.new.route(@tracking_number)
    
    assert_equal res_doc.root.children[0].text, 'OK'
  end

  # <?xml version='1.0' encoding='UTF-8'?><Response service='RouteService'><Head>OK</Head><Body/></Response>
  def test_err_query_route
    res_doc = Fengqiao::Service.new.route(@err_tracking_number)
    
    assert_equal res_doc.root.children[1].children, []
  end
end
