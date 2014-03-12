class PostsController < ApplicationController
  #使用者验证出了index和show之外的所有action
  before_filter :authenticate, :except => [:index, :show]
  #有權限的使用者才可以刪除留言,具体参加post_controller
  #before_filter :authenticate, :only => :destroy
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
      format.xml  { render :xml => @posts } #可以用http://localhost:3000/posts.xml访问，但是没有样式。
      #format.xml { render :xml => @posts.to_xml } #详见http://my.oschina.net/jing31/blog/6587
      format.atom { @feed_title = "My event list" } # index.atom.builder
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html # edit.html.erb
      format.json { render json: @post }
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        #这句含义redirect_to :action => "show", :id => @post
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end

      #以下指定都只是使用指定的樣版檔案，而不會呼叫動作方法，也就是前六個指定方式，都不會呼叫edit方法。
      #以下都表示相同的意思。详见：http://openhome.cc/Gossip/Rails/RenderRedirect.html
      #render :edit
      #render :action => :edit
      #render 'edit'
      #render :action => 'edit'
      #render 'posts/edit'
      #render :action => 'edit.html.erb'
      #render 'edit.html.erb'
      #render 'posts/edit.html.erb'
      #render :template => 'posts/edit'
      #render :template => 'posts/edit.html.erb'
      #render '/path/to/rails/app/views/posts/edit'  #全路径名
      #render '/path/to/rails/app/views/posts/edit.html.erb'
      #render :file => '/path/to/rails/app/views/posts/edit'
      #render :file => '/path/to/rails/app/views/posts/edit.html.erb'
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
