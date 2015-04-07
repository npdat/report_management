class ReportsController < ApplicationController
  before_action :require_user
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.search(params[:search], session[:user_id])
    #@reports = Report.where("user_id = '%i'", session[:user_id])
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @private_messages = PrivateMessage.where("report_id = '%i'", params[:id])
    @private_message = PrivateMessage.new
  end

  # GET /reports/new
  def new
    @report = Report.new
    @upload = Upload.new
  end

  def newest
    @newests = Report.where("strftime('%m', 'now')- strftime('%m', created_at)   < 2")
  end

  def search
    @reports = Report.search(params[:search], nil)
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new
    @report.user_id = session[:user_id]
    #@report.reportname = params[:upload]['report_name']
    @report.reportname = report_params[:reportname]

    #save file upload
    path = Report.upload(report_params[:path])
    if !path.nil?
      if path == "invalid"
        flash[:notice] = "Pdf is invalid"
        redirect_to(:back)
        return
      else
        @report.path = path.to_s
      end
    end

    if @report.save
      redirect_to root_url
    end
    #if !path.nil?
      #@report.path = path.to_s

      #respond_to do |format|
      #if @report.save
        #render :text => "File has been uploaded successfully"
        #redirect_to root_url
        #format.html { redirect_to @report, notice: 'Report was successfully created.' }
        #format.json { render :show, status: :created, location: @report }
        #else
        #format.html { render :new }
        #format.json { render json: @report.errors, status: :unprocessable_entity }
      #end
      #end
    #else
      #render :text => "Pdf is invalid"
    #end


  end

  def uploadFile
    post = Report.save(params[:upload])
    render :text => "File has been uploaded successfully"
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    @report.reportname = report_params[:reportname]
    path = Report.upload(report_params[:path])
    if !path.nil?
      if path == "invalid"
        flash[:notice] = "Pdf is invalid"
        redirect_to(:back)
        return
      else
        @report.path = path.to_s
      end
    end

      if @report.save
        redirect_to reports_url + "/" + @report.id.to_s
      end

    #respond_to do |format|
      #if @report.update(report_params)
        #format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        #format.json { render :show, status: :ok, location: @report }
      #else
        #format.html { render :edit }
        #format.json { render json: @report.errors, status: :unprocessable_entity }
      #end
    #end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url }
      format.json { head :no_content }
    end
  end

  def serve
    path = params[:path]
    send_file( path,
               :disposition => 'inline',
               :type => 'application/pdf',
               :x_sendfile => true )
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:reportname, :path, :user_id)
    end
end
