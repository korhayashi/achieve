module TukuttersHelper
  def choose_index_or_edit
    if action_name == 'index' || action_name == 'confirm' || action_name == 'create'
      confirm_tukutters_path
    elsif action_name == 'edit'
      tukutter_path
    end
  end
end
