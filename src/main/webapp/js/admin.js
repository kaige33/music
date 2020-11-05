$(function() {
	$("#image1").click(function() {
		$("#file").click();
	});
	$("#file").change(function(e){
		$("#url1").val($("#file").val());
		var imgBox = e.target;
        uploadImg(imgBox);
	});
	 function uploadImg(tag) {
         var file = tag.files[0];
         var imgSrc;
         if (!/image\/\w+/.test(file.type)) {
             return false;
         }
         var reader = new FileReader();
         reader.readAsDataURL(file);
         reader.onload = function() {
             //console.log(this.result);
             imgSrc = this.result;
             $("#url1").attr("data-image",imgSrc);
         };
     }
});
