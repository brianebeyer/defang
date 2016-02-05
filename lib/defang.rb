require "defang/version"
require 'uri'

module URI

  def defang
    # save originals
    original_scheme = @scheme
    original_host = @host

    # replace so to_s uses them
    @scheme = @scheme.gsub 't', 'X'
    @host = @host.reverse.sub('.', '[.]').reverse

    defanged_uri = to_s

    # reset originals
    @scheme = original_scheme
    @host = original_host

    defanged_uri
  end

end