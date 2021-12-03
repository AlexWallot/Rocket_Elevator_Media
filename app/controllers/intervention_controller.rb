class InterventionController < ApplicationController
    def create 
        @intervention = Intervention.new
        intervention_param
        if @intervention.save
          flash[:notice] = 'Intervention created successfully'
          redirect_to pages_intervention_url action: :new
        else
          render :new 
        end
        zendesk
    end

    def building
        @customer = params[:customer]
        @building = Building.where(:customerId => @customer).select(:id)

        respond_to do |format|
            format.json  { render :json => @building }      
        end
    end

    def battery
        @building = params[:building]
        @battery = Batterie.where(:buildingId => @building).select(:id)

        respond_to do |format|
            format.json  { render :json => @battery }      
        end
    end

    def column
        @battery = params[:battery]
        @column = Column.where(:batteryId => @battery).select(:id)

        respond_to do |format|
            format.json  { render :json => @column }      
        end
    end

    def elevator
        @column = params[:column]
        @elevator = Elevator.where(:columnId => @column).select(:id)

        respond_to do |format|
            format.json  { render :json => @elevator }      
        end
    end

    private
    def intervention_param
        @intervention.author = current_user.id
        @intervention.customerID = params[:customer]
        @intervention.buildingID = params[:building]
        @intervention.batteryID = params[:battery]
        @intervention.columnID = params[:column]
        @intervention.elevatorID = params[:elevator]
        @intervention.employeeID = params[:employee]
        @intervention.dateAndTimeInterventionStart = nil
        @intervention.dateAndTimeInterventionEnd = nil
        @intervention.report = params[:description]
    end

    def zendesk
        @customer = Customer.where(:id => @intervention.customerID).uniq.pluck(:compagnyName).first
        @author = User.where(:id => @intervention.author).uniq.pluck(:email).first
        ZendeskAPI::Ticket.new($client, :id => 1, :priority => "urgent") # doesn't actually send a request, must explicitly call #save!
        ZendeskAPI::Ticket.create!($client, :type => "problem", :subject => "#{@customer}", :comment => { :value => "Requester: #{@author} 
        The Customer: #{@customer}
        BuildingID: #{@intervention.buildingID}
        BatteryID: #{@intervention.batteryID}
        ColumnID: #{@intervention.columnID}
        ElevatorID: #{@intervention.elevatorID}
        Employee: #{@intervention.employeeID}
        Description: #{@intervention.report}"}, :submitter_id => $client.current_user.id , :priority => "urgent")
      end 
end