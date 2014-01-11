class FavoriteMailer < ActionMailer::Base
  default from: "hudgens.com"

  def new_comment(user, post, comment)
      @user = user
      @post = post
      @comment = comment

      # new headers
      headers["Message-ID"] = "<comments/#{@comment.id}@hudgens.com>"
      headers["In-Reply-To"] = "<post/#{@comment.id}@hudgens.com>"
      headers["References"] = "<post/#{@comment.id}@hudgens.com>"

      mail(to: user.email, subject: "New Comment on #{post.title}")
  end

end
