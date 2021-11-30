class InterventionController < ApplicationController
    def building
        @customer = params[:customer]
        @building = Building.where(:customerId => @customer).select(:id ,:fullNameAdministrator)

        respond_to do |format|
            format.json  { render :json => @building }      
        end
    end

    def battery
        @building = params[:building]
        @battery = Batterie.where(:buildingId => @building).select(:id ,:types)

        respond_to do |format|
            format.json  { render :json => @battery }      
        end
    end

    def column
        @battery = params[:battery]
        @column = Column.where(:batteryId => @battery).select(:id ,:types)

        respond_to do |format|
            format.json  { render :json => @column }      
        end
    end

    def elevator
        @column = params[:column]
        @elevator = Elevator.where(:columnId => @column).select(:id ,:serialNumber)

        respond_to do |format|
            format.json  { render :json => @elevator }      
        end
    end
end