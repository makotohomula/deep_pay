require 'test_helper'

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_index_url #访问对应页面
    assert_response :success  #网页应该响应成功
    assert_select '#columns #side a', minimum: 4  #assert_select 后接数字,表示对数目的检测,#表示对id的引用
    assert_select '#main .entry', 3
    assert_select 'h3', 'Programming Ruby 1.9'  #assert_select 后接字符串或正则表达式,表示字符串匹配
    assert_select '.price', /\$[,\d]+\.\d\d/
  end

end
