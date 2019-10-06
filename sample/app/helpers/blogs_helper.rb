module BlogsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm' || action_name == 'create'
      confirm_blogs_path
    elsif action_name == 'edit'
      confirm_blog_path
    end
  end

  def confirm_new_or_edit
    # ブログ新規投稿とアップデートに分岐したいが…
    if action_name == 'new' || action_name == 'confirm'
      blogs_path
    elsif action_name == 'edit'
      blog_path
    end
  end
end
