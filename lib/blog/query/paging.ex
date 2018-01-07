defmodule Blog.Query.Paging do
    import Ecto.Query
    import Blog.Constants

    def page(query, page) do
        offset = const_page_size * (page-1)
        query
        |> offset([_], ^offset)
        |> limit(^const_page_size)
    end

end
