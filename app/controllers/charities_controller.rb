class CharitiesController < ApplicationController
  # GET /charities
  # GET /charities.xml
  def index
    @charities = Charity.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @charities }
    end
  end

  # GET /charities/1
  # GET /charities/1.xml
  def show
    @charity = Charity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @charity }
    end
  end

  # GET /charities/new
  # GET /charities/new.xml
  def new
    @charity = Charity.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @charity }
    end
  end

  # GET /charities/1/edit
  def edit
    @charity = Charity.find(params[:id])
  end

  # POST /charities
  # POST /charities.xml
  def create
    @charity = Charity.new(params[:charity])

    respond_to do |format|
      if @charity.save
        format.html { redirect_to(@charity, :notice => 'Charity was successfully created.') }
        format.xml  { render :xml => @charity, :status => :created, :location => @charity }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @charity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /charities/1
  # PUT /charities/1.xml
  def update
    @charity = Charity.find(params[:id])

    respond_to do |format|
      if @charity.update_attributes(params[:charity])
        format.html { redirect_to(@charity, :notice => 'Charity was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @charity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /charities/1
  # DELETE /charities/1.xml
  def destroy
    @charity = Charity.find(params[:id])
    @charity.destroy

    respond_to do |format|
      format.html { redirect_to(charities_url) }
      format.xml  { head :ok }
    end
  end
end
