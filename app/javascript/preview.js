document.addEventListener('DOMContentLoaded', function() {
  const ImageList = document.getElementById('image-list');
  
  document.getElementById('item-image').addEventListener('change', function(e) {
    const imageContent = document.querySelector('img');
    const ImageList = document.getElementById("image-list");

    if(imageContent){
      imageContent.remove();
    }
    
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);
    
    const html = `<img src="${blob}", class="preview">`
  
    ImageList.insertAdjacentHTML("beforeend", html)
  });
});