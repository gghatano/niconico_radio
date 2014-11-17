# install.packages("ROAuth)
library("twitteR")
library("ROAuth")

# 各種key
twit.oauth <- OAuthFactory$new(
  handshakeComplete = TRUE,
  signMethod="HMAC",
  consumerKey = "ovA5m5hAcjxDGB1acfZhEm7XT",
  consumerSecret = "so24rfINLroaezilY6hpeOOge4DGlp5OBia5HJsaxFYI5XqDhe",
  oauthKey = "2902739358-nyEEN85IiHAhJCuF9TtVSD2O4ZH4o3ZUoVzYBHD",
  oauthSecret = "rFxtjh73jesJU9qEQr6UM6pfHGnKm0TrDAkHX3uk0NGNO"
)

## 出力したい文字

registerTwitterOAuth(twit.oauth)
message = "
test
"
time = Sys.time()
updateStatus(message)
