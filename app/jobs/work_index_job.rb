# frozen_string_literal: true
class WorkIndexJob < Hyrax::ApplicationJob
  def perform(work)
    work.update_index
  end
end
