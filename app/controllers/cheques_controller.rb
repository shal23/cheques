 class ChequesController < ApplicationController

 # Cheques shown are based on if a selected name is a drawer or payer (or both).
  def index
    if params[:drawer]
      @cheques = Cheque.where(:drawer => params[:drawer])

    elsif params[:payee]
      @cheques = Cheque.where(:payee => params[:payee])

    elsif params[:drawer_payee]
      @cheques_drawer = Cheque.where(:drawer => params[:drawer_payee])
      @cheques_payee = Cheque.where(:payee => params[:drawer_payee])
      @cheques = @cheques_drawer + @cheques_payee

    else
      @cheques = Cheque.all
      
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cheques }
    end
  end

  # GET /cheques/1
  # GET /cheques/1.json
  def show
    @cheque = Cheque.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cheque }
    end
  end

  # GET /cheques/new
  # GET /cheques/new.json
  def new
    @cheque = Cheque.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cheque }
    end
  end

  # GET /cheques/1/edit
  def edit
    @cheque = Cheque.find(params[:id])
  end

  # POST /cheques
  # POST /cheques.json
  def create
    @cheque = Cheque.new(params[:cheque])

    respond_to do |format|
      if @cheque.save
        format.html { redirect_to @cheque, notice: 'Cheque was successfully created.' }
        format.json { render json: @cheque, status: :created, location: @cheque }
      else
        format.html { render action: "new" }
        format.json { render json: @cheque.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cheques/1
  # PUT /cheques/1.json
  def update
    @cheque = Cheque.find(params[:id])

    respond_to do |format|
      if @cheque.update_attributes(params[:cheque])
        format.html { redirect_to @cheque, notice: 'Cheque was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cheque.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cheques/1
  # DELETE /cheques/1.json
  def destroy
    @cheque = Cheque.find(params[:id])
    @cheque.destroy

    respond_to do |format|
      format.html { redirect_to cheques_url }
      format.json { head :no_content }
    end
  end
end