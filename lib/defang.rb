require "defang/version"
require 'uri'

module URI

  def defang
    # save originals
    original_scheme = @scheme
    original_host = @host

    # replace so to_s uses them
    @scheme = @scheme.gsub('t', 'X') if @scheme
    @host = @host.reverse.sub('.', '[.]'.reverse).reverse if @host

    defanged_uri = to_s

    # final check to ensure safety
    if defanged_uri.include?('.') && !defanged_uri.include?('[.]')
      defanged_uri.reverse!.sub!('.', '[.]'.reverse).reverse!
    end

    # reset originals
    @scheme = original_scheme
    @host = original_host

    defanged_uri
  end

end