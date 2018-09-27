class Issue < ApplicationRecord
  belongs_to :reporter,
              primary_key: :id,
              foreign_key: :reporter_id,
              class_name: :User

  belongs_to :assignee,
              primary_key: :id,
              foreign_key: :assignee_id,
              class_name: :User

  def self.search(form_params, index_params)
    self.find_by_sql("
      SELECT issues.*
      FROM issues
      JOIN users reporters ON issues.reporter_id = reporters.id
      JOIN users assignees ON issues.assignee_id = assignees.id
      WHERE issues.summary ILIKE '%#{form_params[:summary]}%'
        AND reporters.name ILIKE '%#{form_params[:reporter_name]}%'
        AND assignees.name ILIKE '%#{form_params[:assignee_name]}%'
        ORDER BY #{index_params[:order]}
        LIMIT #{index_params[:page_size]}
        OFFSET #{(index_params[:page].to_i - 1) * index_params[:page_size].to_i}
    ")
  end

  def reporter_name
    reporter.name
  end

  def assignee_name
    assignee.name
  end
end
