data = []

Task.where.not(id: 1).find_each do |task|
  Participant.order(:new_code_name).each do |participant|
    answers = participant.answers.where(task_id: task.id).order(:created_at)

    if answers.count > 0

      first = answers.first.created_at
      last = answers.last.created_at

      data << "#{task.id},#{participant.new_code_name},#{answers.count},#{first.strftime("%H:%M:%S")},#{last.strftime("%H:%M:%S")},#{(last-first).to_i}"
    end
  end
end


puts data