$(function() {

    var search_list = $(".contents.row");

    function appendPost(post) {
        var current_user = post.user_sign_in && post.user_sign_in.id == post.user_id ?
            `<li>
                                    <a href="/posts/${post.id}/edit" data-method="get" >編集</a>
                                  </li>
                                  <li>
                                    <a href="/posts/${post.id}" data-method="delete" >削除</a>
                                  </li>` : "";

        var html = `<div class="content_post" style="background-image: url(${post.image});">
                  <div class="more">
                    <ul class="more_list">
                      <li>
                        <a href="/posts/${post.id}" data-method="get" >詳細</a>
                      </li>
                      ${current_user}
                    </ul>
                  </div>
                  <p>${post.text}</p><br>
                  <span class="name">
                    <a href="/users/${post.user_id}">
                      <span>投稿者</span>${post.nickname}
                    </a>
                  </span>
                </div>`
        search_list.append(html);
    }

    function appendErrMsgToHTML(msg) {
        var html = `<div class='name'>${ msg }</div>`
        search_list.append(html);
    }

    $(".search-input").on("keyup", function() {
        var input = $(".search-input").val();
        console.log(input);
        $.ajax({
                type: 'GET',
                url: '/posts/search',
                data: { keyword: input },
                dataType: 'json'
            })
            .done(function(posts) {
                $(".contents.row").empty();
                if (posts.length !== 0) {
                    posts.forEach(function(post) {
                        appendPost(post);
                    });
                } else {
                    appendErrMsgToHTML("一致するツイートがありません");
                }
            })

        .fail(function() {
            alert('error');
        });

    });
});