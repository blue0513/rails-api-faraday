module Api
  module V1
    class FaradayController < ApplicationController
      def get
        conn = Faraday::Connection.new(url: 'http://localhost:3001') do |builder|
          builder.use Faraday::Request::UrlEncoded  # リクエストパラメータを URL エンコードする
          builder.use Faraday::Response::Logger     # リクエストを標準出力に出力する
          builder.use Faraday::Adapter::NetHttp     # Net/HTTP をアダプターに使う
        end

        res = conn.get '/api/v1/posts'
        render plain: res.body
      end
    end
  end
end
