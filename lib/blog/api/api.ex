defmodule Blog.Api do
	
	def github_repo_commits(user, repo) when
			is_binary(user) or is_atom(user) and
			is_binary(repo) or is_atom(repo) do
		case Tentacat.Commits.list(user, repo) do
			result when is_list(result) and length(result) > 0 -> 
				{:ok, result}
			{number, %{"message" => message}} when is_number(number) ->
				{:error, Integer.to_string(number) <> " " <> message}
			_error ->
				{:error, "Unknown error"}
		end
	end
end