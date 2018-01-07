defmodule BlogWeb.ApiController do
	use BlogWeb, :controller

	alias Blog.Posts

	def index(conn, params) do
		page = Map.get(params, "page", "1")
		|> String.to_integer()
		posts = Posts.list_posts(page)
    	count = Posts.count_posts
    	render conn, "index.json", posts: posts, count: count, page: page
	end
end