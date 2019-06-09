<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>   
<html xmlns="http://www.w3.org/1999/xhtml">   
    <head>   
            <title></title>   
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />   
             <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        </head>   
   
    <body>   
  <div id="contentHolder">
        <video id="video" width="100" height="100" autoplay></video>
        <button id="picture" style="display:block" >拍照</button>
        <canvas style="display:block" id="canvas" width="100" height="100"></canvas>
        <button id="sc" style="display:block" >上传</button>
        <a href="/aa">wode</a>
</div>
<script>
    navigator.getUserMedia = navigator.getUserMedia ||
        navigator.webkitGetUserMedia ||
        navigator.mozGetUserMedia;
    if (navigator.getUserMedia) {
        navigator.getUserMedia({ audio: true, video: { width: 100, height: 100 } },
            function(stream) {
                var video = document.getElementById("video");
                video.src = window.URL.createObjectURL(stream);
                video.onloadedmetadata = function(e) {
                    console.log('nihao44eee4aaaaddda');
                    video.play();
                };
            },
            function(err) {
                console.log("The following error occurred: " + err.name);
            }
        );
    } else {
        console.log("getUserMedia not supported");
    }


    document.getElementById("picture").addEventListener("click", function () {
        debugger;
        var context = document.getElementById("canvas").getContext("2d");
        context.drawImage(video, 0, 0, 100, 100);
    });
    document.getElementById("sc").addEventListener("click", function () {
        var imgData=document.getElementById("canvas").toDataURL("image/png");
        var data2=imgData.substr(22);
        alert(data2);

        debugger;
        console.log(data2);
        $.ajax({
            url:"/sc",
            contentType:"application/json;charset=utf-8",
            data:{"sj":data2},
            datatype:"json",
            type:"post",
            success:function (data) {
                alert(data.msg);

            }

        })

    });
</script>
    </body>   
</html>  
