require File.expand_path "../test_helper.rb", __FILE__

class LeetnessTest < Minitest::Test
  include Rack::Test::Methods
  extend Minitest::Spec::DSL

  def app
    Leetness
  end

  def setup
    @query = "Hello, World!"
    @translation = "h3ll0, w0rld!"
    @validation_required_message = "Parameter is required"
    @validation_blank_message = "Parameter cannot be blank"
  end

  def test_should_get_root_index
    get "/"
    assert last_response.ok?
  end

  def test_api_translation
    get "/api/v1/leetize.json?q=#{@query}"
    assert last_response.ok?
    assert_equal @query, JSON.parse(last_response.body)["query"]
    assert_equal @translation, JSON.parse(last_response.body)["translation"]
  end

  def test_api_validation_params_required
    get "/api/v1/leetize.json"
    assert last_response.bad_request?
    assert_equal @validation_required_message, JSON.parse(last_response.body)["message"]
    assert_equal @validation_required_message, JSON.parse(last_response.body)["errors"]["q"]
  end

  def test_api_validation_params_not_blank
    get "/api/v1/leetize.json?q="
    assert last_response.bad_request?
    assert_equal @validation_blank_message, JSON.parse(last_response.body)["message"]
    assert_equal @validation_blank_message, JSON.parse(last_response.body)["errors"]["q"]
  end
end
