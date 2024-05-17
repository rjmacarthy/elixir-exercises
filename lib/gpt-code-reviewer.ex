# defmodule GptCodeReviewer do
#   use Application
#   @x 10

#   def start(_type, _args) do
#     GptCodeReviewer.main()
#     Supervisor.start_link(fn -> nil end, name: __MODULE__)
#   end

#   def main do
#     case HTTPoison.get("www.google.com") do
#       {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
#         IO.puts body
#       {:ok, %HTTPoison.Response{status_code: 404}} ->
#         IO.puts "Not found :("
#       {:error, %HTTPoison.Error{reason: reason}} ->
#         IO.inspect reason
#     end
#   end
# end
