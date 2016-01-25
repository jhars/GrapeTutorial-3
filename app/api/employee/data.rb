module Employee
	class Data < Grape::API

#==================================>
		resource :employee_data do
			desc "List all Employee"
			


			# - - - - - 
			get do
				EmpDatum.all
			end
			# - - - - - 
			desc "create a new employee"
	## This takes care of parameter validation
			params do
		  	requires :name, type: String
		  	requires :address, type:String
		  	requires :age, type:Integer
			end
		## This takes care of creating employee
			post do
		  EmpDatum.create!({
		    name:params[:name],
		    address:params[:address],
		    age:params[:age]
		  })
			end



		end
#==================================>
		# desc "create a new employee"

		# ## this takes care of parameter validations
		# params do
		# 	requires :name, type: String
		# 	requires :address, type: String
		# 	requires :age, type: Intenger
		# end

		# ## this takes care of creating an employee
		# post do
		# 	EmpData.create!({
		# 		name:params[:name],
		# 		address:params[:address],
		# 		age:params[:age]
		# 		})
		# end
#==================================>
		


	end	
end