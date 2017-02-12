class Api < ActiveRecord::Base
  has_many :tasks, dependent: :destroy

  module DocVersion
    ORIGINAL = :original
    FORKED = :forked
  end

  def practice_task
    tasks.practice.first || tasks.first
  end

  def doc_url_for(doc_version)
    sym_doc_version = doc_version.to_sym
    if sym_doc_version == DocVersion::ORIGINAL
      doc_url
    else
      forked_doc_url
    end

  end
end
