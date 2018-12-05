# Catter

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

# The idea
The idea behind this project is to get some full stack experience with a
functional backend with graphql. I've been darting around actually writing a proper project
for months, so this is it.

# The plan

Users will have a username, an optional email, and a password (with argon2).
Users can create Mews (tweets), which have a content box (280 max) and
likes/replies/Remews. Users should be able to follow other users, and there
should be an endpoint to get their mewfeed, with chronological order.

Some niceties to have would be private profiles, private messages,
notifications, and live updates with graphql subscriptions
