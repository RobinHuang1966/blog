#View Helpers (輔助函式)放在 app/helpers 目錄下，提供一些可以被重複使用的 Views 函式。
module PostsHelper
  def join_tags(post)
    post.tags.map { |t| t.name }.join(", ")
  end
end
