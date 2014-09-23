module Instagram
  module Response
    def self.create( response_hash, response_headers = false )
      data = response_hash.data.dup rescue response_hash
      data.extend( self )
      data.instance_exec do
        @pagination = response_hash.pagination
        @meta = response_hash.meta
        @limit = response_headers["x-ratelimit-limit"] if response_headers
        @limit_remaining = response_headers["x-ratelimit-remaining"] if response_headers
      end
      data
    end

    attr_reader :pagination
    attr_reader :meta
    attr_reader :limit
    attr_reader :limit_remaining
  end
end
