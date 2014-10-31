class RemindersController < ApplicationController
  def index
    @new_reminder = Reminder.new
    @reminders = current_user.reminders
  end

  def create
    reminder = current_user.reminders.new(reminder_params)
    reminder.save

    redirect_to root_path
  end

  def destroy
    reminder = Reminder.find(params[:id])
    reminder.delete

    redirect_to root_path
  end

  private

  def reminder_params
    params.require(:reminder).permit(:content, :remind_at)
  end
end
