class CommentUpdateJob < ApplicationJob
  queue_as :default

  def perform(comment, current_user)
    ProductChannel.broadcast_to(comment.product_id, comment: render_comment(comment, current_user), average_rating: comment.product.average_rating)
  end

  private

    def render_comment(comment, current_user)
      renderer = ::CommentsController.renderer.new
      renderer_env = renderer.instance_eval { @env }
      warden = ::Warden::Proxy.new(renderer_env, ::Warden::Manager.new(Rails.application))
      renderer_env["warden"] = warden
      renderer.render(partial: 'comments/comment', locals: { comment: comment, current_user: current_user })
    end

end
