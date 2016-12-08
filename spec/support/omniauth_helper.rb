
  # def mock_auth_hash
  #   # The mock_auth configuration allows you to set per-provider (or default)
  #   # authentication hashes to return during integration testing.
  #   OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
  #     'provider' => 'facebook',
  #     'uid' => '12345',
  #     'user_info' => {
  #       'username' => 'Tom',
  #       'email' => 'tom@gmail.com'
  #     },
  #     'credentials' => {
  #       'token' => 'mock_token',
  #       'secret' => 'mock_secret'
  #     }
  #   })
  # end

  def set_omniauth(opts = {})
    default = {:provider => :facebook,
               :uuid     => "1234",
               :facebook => {
                              :email => "tom@email.com",
                              :first_name => "Tom",
                            }
              }

    credentials = default.merge(opts)
    provider = credentials[:provider]
    user_hash = credentials[provider]

    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[provider] = {
      'uid' => credentials[:uuid],
      "extra" => {
      "user_hash" => {
        "email" => user_hash[:email],
        "first_name" => user_hash[:first_name]
        }
      }
    }
  end

  def set_invalid_omniauth(opts = {})

    credentials = { :provider => :facebook,
                    :invalid  => :invalid_crendentials
                   }.merge(opts)

    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[credentials[:provider]] = credentials[:invalid]

  end
