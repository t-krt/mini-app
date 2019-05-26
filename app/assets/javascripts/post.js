$(function(){
  function buildHTML(post){
    var html = `<div class="content_post">
                  <h2>${post.title}</h2>
                  <div class=innerS>${post.post}</div>
                  <div class=name><a href=/users/${post.user_id}>${post.user_name}</div>
                  ：
                </div>`
    return html;
  }
  $('#new-post').on('submit', function(e){
    e.preventDefault();
    if ($('.text_title').val() != '' && $('.text_content').val() != '') {
      var formData = new FormData(this);
    }
    var url = '/posts.json'
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $(html).prependTo('.posts').hide().fadeIn(3000);
      $('.text_title').val('');
      $('.text_content').val('');
      $('.waves-button-input').attr('disabled', false);
    })
    .fail(function(){
      alert('正しく入力してください');
      $('.waves-button-input').attr('disabled', false);
    })
  })
})