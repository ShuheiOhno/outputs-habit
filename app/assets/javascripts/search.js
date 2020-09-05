$(function() {
  let search_list = $(".contents.row");

  function appendPost(post) {
    // if(post.user_sign_in && post.user_sign_in.id == post.user_id){
    //   let html = `
    //   <div>${post.title}</div>
    //   test if true
    //   `
    // search_list.append(html);
    // } else {
    //   let html = `
    //   test if false
    //   `
    // search_list.append(html);
    // }
    
    if(post.user_sign_in ){
      let html = `
      <div class="add_search">
      <a class="add_search_link" href="/posts/${post.id}">
      ${post.title}
      </a>
      </div>
      `
    search_list.append(html);
    } else {
      let html = `
      test is false
      `
    search_list.append(html);
    }

  }

  function appendErrMsgToHTML(msg) {
    let html = `<div class='name'>${ msg }</div>`
    search_list.append(html);
  }
  
  
  $(".search-input").on("keyup", function() {
    let input = $(".search-input").val();
    $.ajax({
      type: 'GET',
      url: '/posts/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(posts) {
      search_list.empty();
      if (posts.length !== 0) {
        posts.forEach(function(post){
          appendPost(post);
        });
      }
      else {
        appendErrMsgToHTML("一致するコメントがありません");
      }
    })
    .fail(function() {
      // alert('error')
    });
  });
});