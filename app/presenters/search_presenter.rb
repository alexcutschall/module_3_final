class SearchPresenter < BasePresenter

  def result
    if @model.word.is_a? String
      "'#{@model.word}' is not a valid word."
    else
      "'#{@model.word.text}' is a valid word and its root form is '#{@model.word.root}'."
    end
  end

end
