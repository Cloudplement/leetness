require "sinatra/base"
require "sinatra/namespace"
require "sinatra/param"
require "json"
require "leetize"

class Leetness < Sinatra::Base
  register Sinatra::Namespace

  # Endpoints
  get "/" do
    "#{Leetize.translate("Hello, World!")}"
  end

  namespace "/api/v1" do
    helpers Sinatra::Param

    before do
      content_type "application/json"
    end

    get "/leetize.json" do
      param :q, String, required: true, blank: false

      {
        "query": "#{params[:q]}",
        "translation": Leetize.translate("#{params[:q]}")
      }.to_json
    end
  end

  # Start the server if ruby file executed directly
  run! if app_file == $0
end
