# TwiToRSS

This service will transport your twitter home timeline to RSS feed

# How to use it?

You can allways go to my ([TwiToRss](http://twitorss.herokuapp.com)).
But if you want your own service - just clone a repo and, in `config.ru`, define `API_KEY`, `API_SECRET`, and
then replace `_session_secret_` with your own session secret string (just type in some random symbols. a lot of symbols).

`API_KEY` and `API_SECRET` you can get by ([signing up](https://dev.twitter.com/apps/new)) a twitter app.
