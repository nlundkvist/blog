defmodule BlogWeb.ApiView do
	use BlogWeb, :view

	alias Blog.Posts.{Post, Author}

	def render("index.json", %{:posts => posts, :count => count, :page => page}) do
		%{
			data: Enum.map(posts, &post_json/1),
			status: "200",
			totalPages: count/const_page_size() |> Float.ceil |> round,
			page: page,
			url: const_domain_url() <> "/"
		}
	end

	def post_json(%Post{} = post) do
		%{
			title: post.title,
			preview: (post.content |> String.slice(0..65)) <> "...",
			updated_at: post.updated_at |> Date.to_iso8601,
			posted_at: post.inserted_at |> Date.to_iso8601,
			author: post.author |> author_json,
			url: const_domain_url() <> "/post/" <> post.slug
		}
	end

	def author_json(%Author{} = author) do
		%{
			name: author.name,
			url: const_domain_url() <> "/author/" <> (author.id |> Integer.to_string)
		}
	end
end