module CommentsHelper
  def find_email id
    User.find_by(id: id).email
  end
end
