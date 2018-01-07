defmodule BlogWeb.Util.DateFormatter do

  def format_date(%NaiveDateTime{:year => year, :month => month, :day => day}) do
    format_month(month) <> " " <> to_string(day) <> ", " <> to_string(year)
  end

  def format_month(month) when is_number(month) and month >= 1 and month <= 12 do
    case month do
      1 -> "January"
      2 -> "February"
      3 -> "March"
      4 -> "April"
      5 -> "May"
      6 -> "June"
      7 -> "July"
      8 -> "August"
      9 -> "September"
      10 -> "October"
      11 -> "November"
      12 -> "December"
    end
  end
  
end