module Novaposhta
  class Base

    cattr_accessor :url, :api_key, :sender, :format

    class << self

      def simple_name
        name.split('::').last
      end

      def req(opts = {})
        post_request caller_locations(1, 1)[0].label, opts
      end


      # def self.class_attr_accessor(*names)
      #   names.each do |name|
      #     define_singleton_method("#{name.to_s}=".to_sym) { |attr| class_variable_set("@@#{name.to_s}", attr) }
      #     define_singleton_method(name.to_sym) { class_variable_get("@@#{name.to_s}") }
      #   end
      # end

      def post_request(called_method, options = {})
        uri = URI(url.gsub(/\{format\}/, "#{format.to_s}"))
        request = Net::HTTP::Post.new(uri)
        format_request!(request, {
            "modelName": simple_name,
            "calledMethod": called_method.camelize(:lower),
            "methodProperties": options.deep_transform_keys(&:camelize),
            "apiKey": api_key
        })
        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
          http.request request
        end
        format_response(response)
      rescue
        puts "Error: #{$!}"
      end

      private

      def format_request!(request, body)
        if format.to_sym == :json
          request.content_type = 'application/json'
          request.body = body.to_json
        elsif format.to_sym == :xml
          request.content_type = 'text/xml'
          request.body = body.to_xml.gsub(/\n/, '').gsub(/>\s+</, '><')
        end
      end

      def format_response(response)
        if format.to_sym == :json
          JSON.parse(JSON.parse(response.body).deep_transform_keys { |k| ActiveSupport::Inflector.underscore(k) }.to_json, object_class: OpenStruct)
        elsif format.to_sym == :xml
          Nokogiri::XML(response.body)
        end
      end
    end
  end
end
