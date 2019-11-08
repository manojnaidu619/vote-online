class VoterController < ApplicationController

  def voter_registration
    @voter = Voter.new
  end

  def submit_voter_registration
    @voter = Voter.create!(voter_params)
  end

end

private

def voter_params
  params.require(:voter).permit(:name, :usn, :email, :candidate_id)
end
