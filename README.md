This is Ajit Satarkar's demo of integrating the Imgur server.

For validation, one can replace the value of the accessToken constant with their access token from the AppConstants file. You will then get images of your own.

I was unable to make use of the search API for Imgur (/search/top/week) with the endpoint (code on the basic branch):

"https://api.imgur.com/3/gallery/search/top/week/0?q=all"

So, in this demo, I made use of the account/me API:

"https://api.imgur.com/3/account/me"

This API will give my own images only, but the search functionality won't be available.

As of now, there are two working branches: clean_architecture and main.

