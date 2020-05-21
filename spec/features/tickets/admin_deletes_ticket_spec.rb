require 'rails_helper'

RSpec.describe 'Deleting a Ticket', type: :feature do

end


# Feature: Admin deleting Ticket
# As an admin
# Given the submitted tickets screen
# When I press the delete button
# And I confirm the deletion
# Then I should see “Ticket # was deleted” on the screen and the ticket is removed from the database and list of submitted tickets

# Feature: Admin decides not to delete Ticket
# As an admin
# Given the submitted tickets screen
# When I press the delete button
# And I cancel the deletion
# Then I should see nothing change

# Accidental Feature: Admin deletes ticket that does not exist
# As an admin
# Given the submitted tickets screen
# When I press the delete button
# And I have the same ticket open in another tab
# And I confirm the deletion
# And I try and delete the same ticket
# Then a ‘Ticket does not exist’ error is raised