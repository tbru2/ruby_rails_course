module Api
    class RacesController < ApplicationController
        protect_from_forgery with: :null_session

        rescue_from Mongoid::Errors::DocumentNotFound do |exception|
            render :status => :not_found, :template=>"api/error_msg", :locals=>{ :msg=>"woops: cannot find race[#{params[:race_id]}]"}
        end

        rescue_from ActionView::MissingTemplate do |exception|
            Rails.logger.debug exception
            render :status=> :unsupported_media_type, plain: "woops: we do not support that content-type[#{request.accept}]"
        end

        def index
            if !request.accept || request.accept == "*/*"
                render plain: "/api/races/, offset=[#{params[:offset]}], limit=[#{params[:limit]}]"
            else
            end
        end

        def show
            race = Race.find params[:race_id]
            if !request.accept || request.accept == "*/*"
                render :status=>:not_found, :template=>"api/error_msg", :locals=>{ :msg=>"woops: cannot find race[#{params[:race_id]}]"}
            else
                render :status=> :ok, :template=>"api/race_show", :locals=>{:race=>{"name"=>race.name, "date"=>race.date}}
            end
        end
        
        def results_index
            if !request.accept || request.accept == "*/*"
                render plain: "/api/races/#{params[:race_id]}/results"
            else
                @race=Race.find params[:race_id]
                @entrants = @race.entrants
                unless stale? @entrants
                    render plain: fresh_when(last_modified: Race.find(params[:race_id]).entrants.max(:updated_at))
                else
                    render status: :not_modified, plain: ''
                end
            end
        end
        
        def update_results
            entrant=Race.find(params[:race_id]).entrants.where(:id=>params[:id]).first
            result=params[:result]
            if result
                if result[:swim]
                    entrant.swim=entrant.race.race.swim
                    entrant.swim_secs = result[:swim].to_f
                end
                if result[:t1]
                    entrant.t1=entrant.race.race.t1
                    entrant.t1_secs = result[:t1].to_f
                end
                if result[:bike]
                    entrant.bike=entrant.race.race.bike
                    entrant.bike_secs = result[:bike].to_f
                end
                if result[:run]
                    entrant.run=entrant.race.race.run
                    entrant.run_secs = result[:run].to_f
                end
            end
            entrant.save
            render json: entrant, status: :created
        end

        def results_show
            if !request.accept || request.accept == "*/*"
                render plain: "/api/races/#{params[:race_id]}/results/#{params[:id]}"
            else
                @result=Race.find(params[:race_id]).entrants.where(:id=>params[:id]).first
                render :partial=>"result", :object=>@result
            end
        end

        def create
            race = Race.new race_params
            race.save
            render plain: race.name, status: :created
               
        end
        
        def update
            Rails.logger.debug("method=#{request.method}")
            race = Race.find(params[:race_id])
            if race.update(race_params)
                render json: race, status: :ok
            else
            end
        end

        def destroy
            Race.find(params[:race_id]).destroy
            render plain: :nothing, status: :ok
        end

        private
            def race_params
                params.require(:race).permit(:name, :date)
            end
    end
end