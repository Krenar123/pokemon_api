# frozen_string_literal: true

module PokemonProxy
  module PokemonErrors
    PokemonAPIError = Class.new(StandardError)
    BadRequestError = Class.new(PokemonAPIError)
    UnauthorizedError = Class.new(PokemonAPIError)
    ForbiddenError = Class.new(PokemonAPIError)
    ApiRequestsQuotaReachedError = Class.new(PokemonAPIError)
    NotFoundError = Class.new(PokemonAPIError)
    UnprocessableEntityError = Class.new(PokemonAPIError)
    ApiError = Class.new(PokemonAPIError)

    HTTP_OK_CODE = 200
    HTTP_BAD_REQUEST_CODE = 400
    HTTP_UNAUTHORIZED_CODE = 401
    HTTP_FORBIDDEN_CODE = 403
    HTTP_NOT_FOUND_CODE = 404
    HTTP_UNPROCESSABLE_ENTITY_CODE = 429
  end
end
