source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rake"
gem "sinatra"
gem "sinatra-contrib"
gem "sinatra-param"

gem "leetize", github: "cloudplement/leetize"

group :development, :test do
  gem "rubocop", require: false
end

group :test do
  gem "minitest"
  gem "rack-test"
end
