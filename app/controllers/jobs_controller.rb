class JobsController < ApplicationController
  def index
   # @jobs = Job.all

   #This means for every 25 jobs,
   # paginate using the parameters sent through from the browser
   @jobs = Job.page(params[:page]).per(25)
  end

  def new
    @job = Job.new
  end

  def create
    #@job = Job.new
    # To keep it secure, we use different way to save the user data..

    #What we’re saying here is make a new job from the form data 
    #but only allow jobs to be submitted with title, company and url data

    @job = Job.new(params.require(:job).permit(:title, :company, :url))

    if @job.save
      redirect_to root_path
    else
      render "new"
    end
  end
end
