class VoterController < ApplicationController

  def voter_registration
    @voter = Voter.new
  end

  def submit_voter_registration
    @voter = Voter.new(voter_params)
    if @voter.save
      redirect_to root_path
      session[:user_id] = @voter.id
    else
      render "voter_registration"
    end
  end

  def vote_now

  end

end

private

def voter_params
  params.require(:voter).permit(:name, :usn, :email)
end
