# frozen_string_literal: true

module PokemonProxy
  class Base
    include PokemonProxy::PokemonErrors

    API_VERSION = 'api/v2'
    API_ENDPOINT = "https://pokeapi.co/#{API_VERSION}".freeze

    private

    def client
      @_client ||= Faraday.new(API_ENDPOINT) do |client|
        client.request :url_encoded
        client.adapter Faraday.default_adapter
      end
    end

    def request(http_method:, endpoint:, params: {})
      response = client.public_send(http_method, endpoint, params)
      begin
        parsed_response = Oj.load(response.body)
        return parsed_response if response_successful?(response)
      rescue StandardError => e
        print e
      end

      raise error_class(response), "Code: #{response.status}, response: #{response.body}"
    end

    def error_class(response)
      case response.status
      when HTTP_BAD_REQUEST_CODE
        BadRequestError
      when HTTP_UNAUTHORIZED_CODE
        UnauthorizedError
      when HTTP_FORBIDDEN_CODE
        return ApiRequestsQuotaReachedError if api_requests_quota_reached?

        ForbiddenError
      when HTTP_NOT_FOUND_CODE
        NotFoundError
      when HTTP_UNPROCESSABLE_ENTITY_CODE
        UnprocessableEntityError
      else
        ApiError
      end
    end

    def response_successful?(response)
      response.status == HTTP_OK_CODE
    end

    def api_requests_quota_reached?
      response.body.match?(API_REQUSTS_QUOTA_REACHED_MESSAGE)
    end
  end
end
