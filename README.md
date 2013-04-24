Installation
============

You must create a [`.env`](http://ddollar.github.io/foreman/#ENVIRONMENT) file like this:

    FACEBOOK_APP_ID="APP_ID"
    FACEBOOK_SECRET="SECRET"

    GOOGLE_MAPS_KEY="MAPS_KEY"
    GOOGLE_GEOCODER_KEY="SECRET"

To run the app, use `foreman start`

Errors
------

You may run into an issue configuring OmniAuth (as part of Devise) relating to SSL certificates ([more info](http://stackoverflow.com/questions/3977303/omniauth-facebook-certificate-verify-failed)). One fix is to get a copy of the cacert.pem file from http://curl.haxx.se/ca/cacert.pem, place it in your filesystem, and then add this line to /config/initializers/devise.rb:

```
require 'omniauth-facebook'
config.omniauth :facebook, 'YOUR APP ID', 'YOUR APP SECRET', :client_options => {:ssl => {:ca_file => '/System/Library/OpenSSL/certs/cacert.pem'}}
```

This should only be necessary with older versions of OpenSSL.
