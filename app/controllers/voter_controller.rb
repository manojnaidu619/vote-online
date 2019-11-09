class VoterController < ApplicationController
  before_action :check_if_not_voted?

  def voter_registration
    @voter = Voter.new
  end

  def submit_voter_registration
    @usn = Voter.where(usn: params["voter"]["usn"].upcase)
    if @usn.count > 0
      redirect_to voter_registration_path, status: 302
      flash[:info] = "Already Voted!"
    else
      @voter = Voter.new(voter_params)
      if @voter.save
        redirect_to root_path
        session[:user_id] = @voter.id
      else
        render "voter_registration"
      end
    end
  end

  def vote_now
    @candidates = Candidate.all
  end

  def register_vote
    @candidate = Candidate.find_by_id(params["id"].to_i)
    @candidate.vote_count += 1
    if @candidate.save
      redirect_to root_path(voted: true)
      session[:user_id] = nil
    else
      render 'vote_now'
    end
  end

end

private

def voter_params
  params.require(:voter).permit(:name, :usn, :email)
end

def check_if_not_voted?
  session["voted"] == false
end
