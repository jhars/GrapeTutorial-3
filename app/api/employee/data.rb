module Employee
	class Data < Grape::API

# Below is how we Structure Routes
# API Archtecture
# -> Rules Similar to RESTful
# ?-> ...but for more custom-routing?
#==================================>
		resource :employee_data do
			desc "List all Employee"
			get do
				EmpDatum.all
			end
# CREATE Employee
#-------------------------------------------->
			desc "create a new employee"
			# Parameter Validation
			params do
		  	requires :name, type: String
		  	requires :address, type:String
		  	requires :age, type:Integer
			end
			# actually Creating Employee Route w/ params
			post do
		  EmpDatum.create!({
		    name:params[:name],
		    address:params[:address],
		    age:params[:age]
		  })
			end
#-------------------------------------------->
# DELETE Employee
			desc "delete an employee"
			params do
				requires :id, type:String
			end
			delete ':id' do
				EmpDatum.find(params[:id]).destroy!
			end
#-------------------------------------------->
# UPDATE Employee
		desc "update an employee address"
		params do
			requires :id, type:String
			requires :address, type:String
		end
		put ':id' do
			EmpDatum.find(params[:id]).update({
				address:params[:address]
				})
		end


#-------------------------------------------->
		end

	end	
end