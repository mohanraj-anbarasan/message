class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
	require'authenticated_system.rb'
	include AuthenticatedSystem
	before_filter :force_login, :except=>[:create,:new]
      
	layout "application",:except=>[:message]
	

	PAGINATION_COUNT = Message::PER_PAGE
  PER_PAGE = 5

  # render new.rhtml
  def new
    @user = User.new
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      redirect_to('/login', :notice => "Thanks for signing up!")
    else
      flash.now[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
			
      render :action=>'new'
    end
end

def create1
	@message=Message.new(:message=>params[:message], :user_id=>params[:user_id], :is_display=>'0')
	@message.save
	redirect_to("/employee" , :notice => "Message has been successfully sent")
end

def employee
	@employee=User.all
end

def message
	@employee=User.find_by_id(params[:id])
end

def inbox
	@messages=current_user.messages
  #~ @details_inbox = @messages.paginate(:page=>params[:page],:per_page=>PAGINATION_COUNT )      
	#~ @messages = @details_inbox
  
end

def dashboard
	if params[:id] 
	@mess=Message.find_by_id(params[:id])
		if @mess.is_display==false   
		@mess.update_attribute('is_display',1)
		else
		@mess.update_attribute('is_display',0)
		end
	end
	 @messages_dashboard=Message.find(:all,:conditions=>['is_display=?',1], :order => "updated_at DESC")
	 @details = @messages_dashboard.paginate(:page=>params[:page],:per_page=>PAGINATION_COUNT )      
	 @messages_dashboard  = @details

end
end