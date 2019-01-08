module Api
    class RacersController < ApplicationController

        protect_from_forgery with: :null_session

        def index
            if !request.accept || request.accept == "*/*"
                render plain: "/api/racers"
            else
            end
        end

        def show
            if !request.accept || request.accept == "*/*"
                render plain: "/api/racers/#{params[:id]}"
            else
            end
        end
    
        def entries_index
            if !request.accept || request.accept == "*/*"
                render plain: "/api/racers/#{params[:racer_id]}/entries"
            else
            end
        end
        
        def entries_show
            if !request.accept || request.accept == "*/*"
                render plain: "/api/racers/#{params[:racer_id]}/entries/#{params[:id]}"
            else
                render plain: :nothing, status: :ok
            end
        end

        def create
            if !request.accept || request.accept == "*/*"
                render plain: :nothing, status: :ok
            else
                #real implementation
                
            end
        end
    end
end