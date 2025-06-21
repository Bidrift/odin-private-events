class AttendancesController < ApplicationController
    before_action :authenticate_user!

    def create
        @attendance = Attendance.new(attendance_params)
        if current_user.id != @attendance.attendee_id
            return head(:unauthorized)
        end
        if @attendance.save
            flash[:notice] = 'You have successfully signed up for this event!'
            redirect_to event_path @attendance.attended_event
        else
            head(:unprocessable_entity)
        end
    end

    def destroy
        @attendance = Attendance.find(params[:id])
        if @attendance.delete
            flash[:notice] = 'You have successfully cancelled your attendance for this event!'
            redirect_to event_path @attendance.attended_event
        else
            head(:unprocessable_entity)
        end

    end

    private

    def attendance_params
        params.expect(attendance: [:attendee_id, :attended_event_id])
    end
end
