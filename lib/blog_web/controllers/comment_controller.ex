defmodule BlogWeb.CommentController do
	use BlogWeb, :controller

	alias Blog.Posts

	def create(conn, %{"comment" => comment_params}) do
		p = Map.get(comment_params, "post_id") |> String.to_integer |> Posts.get_post!
		case Posts.create_comment(comment_params) do
			{:ok, comment} ->
				conn
				#|> put_flash(:info, "Comment created successfully.")
				|> redirect(to: post_path(conn, :show, p.slug))
      		{:error, %Ecto.Changeset{} = changeset} ->
      			render(conn, "new.html", changeset: changeset)
  		end
	end
end