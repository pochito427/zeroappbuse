module Api
  module V1
    class ContactsController < ApplicationController
      #before_action :authenticate_request!, :set_contact, only: [:show, :update, :destroy]

      # GET /contacts
      def index
        @contacts = Contact.all

        render json: @contacts, status: :ok
      end

      # GET /contacts/1
      def show
        render json: @contact
      end

      # POST /contacts
      def create
        @contact = @user.contacts.create(contact_params)

        if @contact.save
          render json: @contact, status: :created, location: @contact
        else
          render json: @contact.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /contacts/1
      def update
        if @contact.update(contact_params)
          render json: @contact
        else
          render json: @contact.errors, status: :unprocessable_entity
        end
      end

      # DELETE /contacts/1
      def destroy
        @contact = Contact.where(id: params[:id]).first
        if @contact.destroy
          head(:ok)
        else
          head(:unprocessable_entity)
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_contact
          @contact = Contact.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def contact_params
          params.require(:contact).permit(:name, :mobilephone_number, :email, :user_id)
        end
    end
  end
end