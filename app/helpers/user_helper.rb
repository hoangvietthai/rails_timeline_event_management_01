module UserHelper
  def first_part_of email
    email.split("@").first
  end
end
