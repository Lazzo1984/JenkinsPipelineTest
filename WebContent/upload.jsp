<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"/>
   <!--
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootswatch/3.2.0/sandstone/bootstrap.min.css">
    -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    
<title>File Upload</title>
</head>
<body>
    <div class="form-group" style="float:left;">
    <form method="post" action="UploadServlet" enctype="multipart/form-data">
            Select file to upload: <input type="file" name="uploadFile" class="btn btn-sm btn-primary RBanner"/>
            <br/><br/>
            <input type="submit" value="Upload" class="btn btn-sm btn-primary RBanner"/>
        </form>
       </div>
       <div style="float:left;">
       
     <!--   <iframe src="http://10.221.7.43:3080" width="1024" height=1024""></iframe> -->
       </div>
        
   
</body>
</html>