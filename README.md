=======
#youtube-api
===========

Simple sinatra application uses twitter api to generate movie searches via youtube api

=======
#ratpack
===========

a simple boilerplate for creating production-ready sinatra apps that use activerecord and sqlite

twitterbootstrap using html and css are included.

if ya want haml and sass, be on the look for classy.

## Up and running
1. `bundle install`
2. `shotgun`
3. visit `localhost:9393`

## Gemfile
- [sinatra](http://www.sinatrarb.com/): web framework
- [sqlite3](https://github.com/luislavena/sqlite3-ruby): Database
- [activerecord](http://guides.rubyonrails.org/active_record_querying.html): ORM
- [sinatra-activerecord](https://github.com/bmizerany/sinatra-activerecord)
- [rake](http://rake.rubyforge.org/)

### Development
   * [shotgun](https://github.com/rtomayko/shotgun)
   * [tux](http://tagaholic.me/2011/04/10/tux-a-sinatra-console.html)





# Sample Sinatra App for Twitter API v1.1 Calls

Read more about this here: [Them Blogs](http://thisbythem.com/blog/simple-sinatra-for-twitter-api-pie-guy-fieri/)

Twitter's new API got ya down? Requests coming back as 410? Gone gone gone.

Fork. Bundle. Update. Done.

This is good to push up to Heroku once you update you're credentials.

## Restrict Access

I would recommend restricting access to the app so your rate limits aren't compromised. For example: Check the request referrer.

```
if request.referrer == "http://example.com/blog/"
  jsonp @@twitter_client.home_timeline.map(&:attrs)
else
  status 401
end


