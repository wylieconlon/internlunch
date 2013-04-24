# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
Internlunch::Application.config.secret_token = ENV['SECRET_TOKEN'] || 'd829671d0fc7b81400c1d60af19ae6527bbca75f44db5afe34856001f45d64d931c77d431f7f0c55436698d5d8804a06fefdf0f74120dd4a8e4c620bb62b4a0e'
