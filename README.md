# AASM Paperclip Example

This repo is an example application that demonstrates the ability to track specific changes for AASM with paperclip.

It is a possible solution response to: https://github.com/aasm/aasm/issues/490

## Initial Requirements

- Track model AASM state transitions and all changed data
- Be able to query for specific transitions

## Why use Paperclip

- The version is isolated against all the noise of the rest of versions thus allows it to become a first class citizen/tracking object.
  - Get papertrail version/change querying.
- For us, the transitioning event name was enough to query/isolate against specific transitions, but it is possible to query directly against object changes.
- We also wanted to only track transitions and realized if there were other versions being created other than event transitions, we would immediately know we had leaky mutations.
  - In this case, over-tracking is helpful.
  - When between-transition mutations are valid, just put a scope on the version model that filters the CRUD events.

# To Run

1. `git clone `
1. `cd `
1. `bundle install`
1. `bundle exec rails db:setup`
1. `bundle exec rails db:seed`
1. `bundle exec rails s`
1. Visit `http://localhost:3000/posts`
1. Login with
    - Username: `admin@example.com`
    - Password: `admin`

# What is happening

- All posts' changes are tracked via a separate model which is a first class citizen in table `post_versions`.
- All changes to comments and users are tracked via normal versions table.
