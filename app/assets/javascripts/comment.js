// $(function(){
//   // コメント内容
//   function buildHTML(comment){
//     let html = `<div>投稿しました</div>
//     <div style="background-color:lightgreen;" class="comment">
//     <div class="comment__name">
//     <a href="/users/1">
//     ${comment.user_name}
//     さん
//     </a></div>
//     <div style="white-space: pre-wrap;" class="comment__text">${comment.text}</div>
//     <div class="comment__time">
//     ${comment.created_at}
//     </div>
//     </div>`
//     return html;
//   }
//   $(".text_submit").on('submit', function(e){
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
//       let html = buildHTML(data);
//       $('.Asynchronous').append(html);
//       $('.textbox').val('');
//       $('.form_submit').prop('disabled', false);
//     })
//   })
// })