ActiveAdmin.register User do

  permit_params :email, :encrypted_password, :first_name, :last_name, :gender, :username, :date_of_birth, :mobile

  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :gender
    column :username
    column :date_of_birth
    column :mobile
    actions
  end

  filter :email
  filter :first_name
  filter :last_name
  filter :gender
  filter :username
  filter :date_of_birth
  filter :mobile

  form do |f|
    f.inputs do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :gender
      f.input :username
      f.input :date_of_birth
      f.input :mobile
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
  controller do

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to admin_users_path
      else
        render 'new'
      end
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to admin_users_path
      else
        render 'edit'
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :gender, 
                                    :username, :date_of_birth, :mobile, :password, :password_confirmation)
    end
  end
end
