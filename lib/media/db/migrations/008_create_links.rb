Sequel.migration do
  change do
    create_table :links do
      citext :url, primary_key: true

      validate do
        presence   :url
        max_length 255, :url
        format %r{^(([^:/?#]+):)(//([^/?#]*))?([^?#]*)(\?([^#]*))?(#(.*))?}, :url
      end
    end
  end
end
