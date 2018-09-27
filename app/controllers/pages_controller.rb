class PagesController < ApplicationController

  def index
    if params[:form].present?
      @issues = Issue.search(form_params, index_params).to_a
      @form_params = form_params.merge(index_params)
    else
      @issues = []
      @form_params = blank_form
    end
    render template: "pages/index"
  end

  private

  def check_for_clear
    debugger
  end

  def blank_form
    {
      summary: "",
      reporter_name: "",
      assignee_name: "",
      page: 1,
      page_size: 10,
      order: nil,
      blank: true
    }
  end

  def form_params
    params.require(:form).permit(
      :summary,
      :reporter_name,
      :assignee_name
    )
  end

  def index_params
    params.require(:form).permit(
      :page,
      :page_size,
      :order
    )
  end
end
