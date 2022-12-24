ActiveAdmin.register Post do

  permit_params :title, :description, :user_id, :avatar

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :user
    column :avatar
    actions
  end

  filter :title
  filter :description
  filter :user_id
  filter :avatar

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :user_id, as: :select, :collection => User.pluck(:first_name, :id)
      # f.input :avatar
    end
    f.actions
  end

  controller do

    def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to admin_posts_path
      else
        render 'new'
      end
    end

    def update
      @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to admin_posts_path
      else
        render 'edit'
      end
    end

    private

    def post_params
      params.require(:post).permit(:title, :description, :user_id, :avatar )
    end
  end
end
