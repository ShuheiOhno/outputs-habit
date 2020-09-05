// // 追加予定いいね非早期

// $(function(){
//   function likeCount(post){
//         let html = `
//         <div class="comment_count">
//         コメント数:
//         ${post.comments.count}
//         </div>`
//         return html;
//       }
//   $(".like_push").on('click', function(e){
//     e.preventDefault()
//     console.log(this)
//     // $(".Like_count").text(@post.likes.count + 1)
//     // let url = $(this).attr('href');
//     // console.log(url)
//     // let formData = new FormData(this);
//     // console.log(formData)
//     // $.ajax({
//     //   url: url,
//     //   type: 'POST',
//     //   data: formData,  
//     //   dataType: 'json',
//     //   processData: false,
//     //   contentType: false
//     // })
//     // .done(function(data){
//     //   let html = likeCount(data);
//     //   $('.TTT').append(html);
//       //       // $('.textbox').val('');
//       //       // $('.form_submit').prop('disabled', false);
//     // })
//   })
// })





// $(function(){
//   // いいね非同期
//   function likeCount(post){
//     let html = `
//     <div class="comment_count">
//     コメント数:
//     ${post.comments.count}
//     </div>`
//     return html;
//   }
//   $(".like_push").on('click', function(e){
//     e.preventDefault()
//     console.log(this)
//     let url = $(this).attr('action');
//     let formData = new FormData(this);
//     $.ajax({
//       url: url,
//       type: 'POST',
//       data: formData,  
//       dataType: 'json',
//       processData: false,
//       contentType: false
//     })
//     .done(function(data){
//       let html = likeCount(data);
//       $('.TTT').append(html);
//       // $('.textbox').val('');
//       // $('.form_submit').prop('disabled', false);
//     })
//   })
// })