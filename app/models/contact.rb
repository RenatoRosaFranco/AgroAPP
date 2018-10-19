# frozen_string_literal: true
class Contact < Object
	include ActiveModel::Conversion
	include ActiveModel::Validations
	include MailerInterfaceable

	attr_accessor :name,  :email, :subject, :message

	def initialize(params = {})
		@name    = params[:name]
		@email   = params[:email]
		@subject = params[:subject]
		@message = params[:message]
	end

	def persisted?
	  false
	end

	validates :name,
						presence: true,
						uniqueness: false,
						allow_blank: false,
						length: { minimum: 3, maximum: 30 }

	validates :email,
						presence: true,
						uniqueness: false,
						allow_blank: false,
						length: { minimum: 3, maximum: 145 }

	validates :subject,
						presence: true,
						uniqueness: false,
						allow_blank: false,
						length: { minimum: 3, maximum: 60 }

	validates :message,
						presence: true,
						uniqueness: false,
						allow_blank: false,
						length: { minimum: 3, maxium: 4_000 }
end	