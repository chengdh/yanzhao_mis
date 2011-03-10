class SuggestionsController < MessagesController
  def new
    @suggestion = Suggestion.new(:org => current_user.org)
    @suggestion.message_visitors.build()
  end
end
