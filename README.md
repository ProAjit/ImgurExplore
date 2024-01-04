This is Ajit Satarkar's demo of integrating the Imgur server.

This demo will work as it is with my accessToken used in demo.

For validation, one can also replace the value of the accessToken constant with their access token from the AppConstants file. 

You will then get images of your own.

I was unable to make use of the search API for Imgur (/search/top/week) with the endpoint (code on the basic branch):

"https://api.imgur.com/3/gallery/search/top/week/0?q=all"

So, in this demo, I made use of the account/me API:

"https://api.imgur.com/3/account/me"

This API will give my own images only, but the search functionality won't be available.

All three branches are working means API integration is completed, but network architecture and UI-Data binding is partly completed.
In 'clean_architecture' and 'main' branch code is same and it follows clean architecture principle, with 75% coverage.
In 'basic' branch MVVM architecture is followed with 60% coverage.

 

