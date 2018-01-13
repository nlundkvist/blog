defmodule BlogWeb.GithubController do
	use BlogWeb, :controller
	alias Blog.Api

	def show(conn, _params) do
		{:ok, commits} = Api.github_repo_commits(:nlundkvist, :blog)
		render conn, "show.html", commits: commits
	end
end