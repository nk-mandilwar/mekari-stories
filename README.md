# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# ASSIGNMENT

* Exercise for Ruby on Rails developer at Mekari

● Rails api app for creating Post, Comments
○ Api for User Sign Up
○ Api for User login
○ User can create many Post and comments over Posts
○ User should be authenticated before creating Post and Comment
○ User should be able to reply over comment
○ Api to return all posts by user
○ Api to return all posts by any user, api should also be able to sort by
number of comments


# Questions

* 1 

Find the Post with Max Comments.
a. Write Sql query.
b. Write Active Record Statements

* Answer 1
a) SELECT posts.id, posts.title, count(posts.id) as comments_count FROM posts INNER JOIN comments ON comments.post_id = posts.id GROUP BY posts.id ORDER BY comments_count DESC

b) Post.joins(:comments).group(:id).order("comments_count DESC").select("posts.id, posts.title, count(posts.id) as comments_count")

*  2

Find the Users who has commented most
a. Write Sql query
b. Write Active Record Statements

* Answer
a)   SELECT users.id, count(users.id) as comments_count FROM users INNER JOIN comments ON comments.user_id = users.id WHERE (comments.parent_id IS NULL) GROUP BY users.id ORDER BY comments_count DESC

b)  User.joins(:comments).where("comments.parent_id IS NULL").group(:id).order("comments_count DESC").select("users.id, count(users.id) as comments_count")
