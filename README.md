# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version - 2.7.0

**Tables** - users, groups, posts, comments, likes, groups_users

**Basic APIs**

1. Create user -
   curl --location 'http://localhost:3000/users' \
    --header 'Content-Type: application/json' \
    --data-raw '{
        "user": {
          "name": "Test1",
          "email": "test@gmail.com"
        }
      }'

2. Create Groups -
   curl --location 'http://localhost:3000/groups' \
    --header 'Content-Type: application/json' \
    --data '{
        "group": {
          "name": "Geeks",
          "description": "A group of tech geeks"
        }
      }'
3. Create Post
   curl --location 'http://localhost:3000/posts' \
    --header 'Content-Type: application/json' \
    --data '{
        "post": {
          "content": "This is a sample post.",
          "user_id": 1,
          "group_id": 1
        }
      }'
4. Fetch posts per user
   curl --location 'http://localhost:3000/users/1/posts'
5. Fetch posts per group
   curl --location 'http://localhost:3000/users/1/posts'
6. Get a post
   curl --location 'http://localhost:3000/posts/1'
7. Create like per post
8. curl --location 'http://localhost:3000/posts/1/likes' \
    --header 'Content-Type: application/json' \
    --data '{
        "like": {
          "user_id": 1,
          "post_id": 1
        }
      }'
9. Create comment per post
    curl --location 'http://localhost:3000/posts/1/comments' \
    --header 'Content-Type: application/json' \
    --data '{
        "comment": {
          "content": "This is a sample comment.",
          "user_id": 1
        }
      }'
10. Delete like for a post
    curl --location --request DELETE 'http://localhost:3000/posts/1/likes/2'
11. Delete comment for a post
    curl --location --request DELETE 'http://localhost:3000/posts/1/comments/2'
