document.addEventListener('turbolinks:load', function() {
  M.Modal._count = 0;
  var elems = document.querySelectorAll('.modal');
  var options = {
    opacity: 0.8,
    inDuration: 100  
  };
  M.Modal.init(elems, options);
});