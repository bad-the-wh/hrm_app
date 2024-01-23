# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

employee1 = Employee.create(LDAP:117474512, name: 'John Doe', email: 'john.doe@example.com', position: 'Developer', birthdate: '1990-01-01')
employee2 = Employee.create(LDAP:874559846, name: 'Jane Doe', email: 'jane.doe@example.com', position: 'Designer', birthdate: '1992-03-15')

employee1 = Employee.first
employee2 = Employee.second

announcement1 = Announcement.create(publication_date: '2022-01-01', title: 'Important Announcement', message: 'Lorem ipsum...', posted_by: employee1, concerned_position: employee2)
announcement2 = Announcement.create(publication_date: '2022-02-01', title: 'Upcoming Event', message: 'Lorem ipsum...', posted_by: employee2, concerned_position: employee1)

evaluation1 = PerformanceEvaluation.create(evaluation_date: '2022-03-01', employee_reviewed: employee1, reviewer: employee2, note: 4, commentary: 'Good performance')
evaluation2 = PerformanceEvaluation.create(evaluation_date: '2022-04-01', employee_reviewed: employee2, reviewer: employee1, note: 5, commentary: 'Excellent performance')

leave_request1 = LeaveRequest.create(employee: employee1, request_date: '2022-05-01', leave_start_date: '2022-06-01', leave_end_date: '2022-06-07', response: 'pending')
leave_request2 = LeaveRequest.create(employee: employee2, request_date: '2022-05-15', leave_start_date: '2022-06-15', leave_end_date: '2022-06-21', response: 'approved')
leave_request3 = LeaveRequest.create(employee: employee1, request_date: '2022-06-01', leave_start_date: '2022-07-01', leave_end_date: '2022-07-07', response: 'canceled')