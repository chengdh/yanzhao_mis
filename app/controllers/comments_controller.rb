class CommentsController < ApplicationController

  # POST /comments
  # POST /comments.xml
  def create
    @comment = Comment.new(params[:comment])
    commentable = Post.find(params[:post_id]) if params[:post_id].present?
    commentable = Suggestion.find(params[:suggestion_id]) if params[:suggestion_id].present?
    @comment.commentable = commentable
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        flash[:notice] = '回复信息创建成功.'
        format.html { redirect_to(commentable) }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        flash[:notice] = '回复信息更新成功.'
        format.html { redirect_to(@comment.commentable) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end
end
