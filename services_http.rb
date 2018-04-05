require 'net/http'
require 'uri'

class ServicesController < ApplicationController

	def run_services

		parametro = "Your object"

		uri = URI.parse("https://example.com")
		request = Net::HTTP::Post.new(uri)
		request.basic_auth("USERNAME", "PASSWORD")
		request.body = parametro
		req_options = {
		use_ssl: uri.scheme == "https",
		}

		response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
		http.request(request)
		end

		p eval(response.body)

		@data = eval(response.body) // Remember... You should have a view of the gem jbuilder
	end

	private

	def some_method
	end

end

