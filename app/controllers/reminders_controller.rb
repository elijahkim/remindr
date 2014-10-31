require 'pusher'

Pusher.app_id = '94922' 
Pusher.key = '152ca23c4ce2a6dbe25f'
Pusher.secret = 'dc4416811a8bccfdf79d'

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

  def hello_world
    Pusher.trigger('my-channel', 'my-event', {:message => 'hello world'})
  end

  private

  def reminder_params
    params.require(:reminder).permit(:content, :remind_at)
  end

end
