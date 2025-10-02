Login to the portal with any username/pass

Grab the session cookie containing a JWT. Decode to find the OTP.

`eyJhdXRoZWQiOnRydWUsIm90cCI6IjEwMzI0OCIsInVzZXJuYW1lIjoiYWFhIn0.aN6Lag.s0k2gmdPunkaU55fMXrM9hKxzcQ`

```json
{
  "authed": true,
  "otp": "103248",
  "username": "aaa"
}
```

Enter OTP to get the flag. Turns out the OTP is hardcoded...
