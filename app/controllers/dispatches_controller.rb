class DispatchesController < ApplicationController
  before_action :set_dispatch, only: %i[ show edit update destroy ]

  # GET /dispatches or /dispatches.json
  def index
    @dispatches = Dispatch.page(params[:page]).per(15)
    # @q = Dispatch.ransack(params[:q])
    # @dispatches = @q.result.includes(:truck, :location, :planter).page(params[:page]).per(10)
    @q = Dispatch.ransack(params[:q])

    if params[:attribute].present? && params[:q][:attribute_cont].present?
      @q = Dispatch.ransack("#{params[:attribute]}_cont" => params[:q][:attribute_cont], 
                            receive_date_gteq: params[:q][:receive_date_gteq], 
                            receive_date_lteq: params[:q][:receive_date_lteq])
    end

    @dispatches = @q.result.includes(:truck, :location, :planter).page(params[:page])
  end

    
  # GET /dispatches/1 or /dispatches/1.json
  def show
  end

  # GET /dispatches/new
  def new
    @dispatch = Dispatch.new
  end

  # GET /dispatches/1/edit
  def edit
  end

  # POST /dispatches or /dispatches.json
  def create
    @dispatch = Dispatch.new(dispatch_params)
    # respond_to do |format|
    #   if @dispatch.save
    #     format.html { redirect_to dispatch_url(@dispatch), notice: "Dispatch was successfully created." }
    #     format.json { render :show, status: :created, location: @dispatch }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @dispatch.errors, status: :unprocessable_entity }
    #   end
    # end
    respond_to do |format|
      if @dispatch.save
        format.html { redirect_to @dispatch, notice: 'Dispatch was successfully created.', just_created: true }
        format.json { render :show, status: :created, location: @dispatch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dispatch.errors, status: :unprocessable_entity }
      end
    end
  end

  # def update_status
  #   @dispatch = Dispatch.find_by(qr_code: params[:qr_code])
  #   if @dispatch
  #     # Update dispatch status logic here
  #     @dispatch.update(status: 'Returned')
  #     render json: { message: 'Dispatch status updated successfully' }
  #   else
  #     render json: { error: 'Dispatch not found' }, status: :not_found
  #   end
  # end

  def scan
    if params[:id].present?
      @dispatch = Dispatch.find(params[:id])
      if @dispatch.qr_code.attached?
        @qr_code_url = url_for(@dispatch.qr_code)
      else
        @qr_code_url = nil  # Handle case when QR code is not attached
      end
    else
      # Handle case when no ID is provided
      flash[:alert] = "Please provide a valid dispatch ID."
      redirect_to dispatches_path
    end

    respond_to do |format|
      format.html # Renders scan.html.erb by default
    end
  end

  def print
    @dispatch = Dispatch.find(params[:id])
    # Additional logic if needed...
  end
  
  # PATCH/PUT /dispatches/1 or /dispatches/1.json
  def update
    respond_to do |format|
      if @dispatch.update(dispatch_params)
        format.html { redirect_to dispatch_url(@dispatch), notice: "Dispatch was successfully updated." }
        format.json { render :show, status: :ok, location: @dispatch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dispatch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dispatches/1 or /dispatches/1.json
  def destroy
    @dispatch.destroy!

    respond_to do |format|
      format.html { redirect_to dispatches_url, notice: "Dispatch was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def receive
    qr_code = params[:qr_code]
  
    Rails.logger.info "Received QR code: #{qr_code}"
  
    if qr_code.present?
      dispatch = Dispatch.find_by(id: qr_code)
      if dispatch
        Rails.logger.info "Dispatch found: #{dispatch.inspect}"
        dispatch.update(status: 'Received', receive_date: Time.zone.now)
        form_html = render_to_string(partial: 'form', locals: { dispatch: dispatch })
        Rails.logger.info "Rendered form HTML: #{form_html}"
        render json: { message: 'Dispatch received successfully.', form: form_html }, status: :ok
      else
        Rails.logger.info "Dispatch not found"
        render json: { error: 'Dispatch not found.' }, status: :not_found
      end
    else
      Rails.logger.info "QR code is missing"
      render json: { error: 'QR code is missing.' }, status: :bad_request
    end
  end

  def receive_form
    # This renders the form where you can scan the QR code
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dispatch
      @dispatch = Dispatch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dispatch_params
      params.require(:dispatch).permit(:truck_id, :location_id, :planter_id, :receive_date, :gross_weight, :status, :description)
    end

    def print_dispatch(dispatch)
      # Logic to print the dispatch
      # This could be a call to a service that sends the print job to the printer
      # For example:
      PrintService.print(dispatch)
    end
end
