App.comments = App.cable.subscriptions.create "CommentsChannel",
  connected: ->
# Called when the subscription is ready for use on the server

  disconnected: ->
# Called when the subscription has been terminated by the server

  received: (data) ->
    @appendComment(data)

  appendComment: (data) ->
    html = @createComment(data)
    $("#comment_content").val("")
    $("#sortable").prepend(html)

  createComment: (data) ->
    """
      <div class="comment" cmt_id="#{data["comment_id"]}">
        <img src="/assets/avatar-814b9495b69133b0f6f3638c139271cad3c8160b0b487f2746ca537bf995a848.jpg" width="40" height="30">
        <strong class="primary-font">#{data["email"]}</strong>
        <small class="pull-right text-muted">
           <span class="glyphicon glyphicon-time"></span>#{data["time"]}ms</small>
        <br>
        <li class="font_comment"> #{data["content"]}</li>
          <a class="fa fa-window-close icon_comment" data-confirm="Are you sure?" data-remote="true" rel="nofollow" data-method="delete" href="/comments/#{data["comment_id"]}"></a>
        <hr data-brackets-id="12673">
      </div>
    """
