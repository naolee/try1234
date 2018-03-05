<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ajax with Jquery</title>
</head>
<body>
    <h1>Ajax with Jquery Simple Example</h1>
    <h3>madushankaperera.wordpress.com</h3>
    <br>
    <form name="form1" method="POST" action="NewServlet1" id="form1">
        <table>
            <tr> 
                <td>                    
                    <select name="changeStatus" id="changeStatus">
                        <option value="Newest -- Oldest">Newest -- Oldest</option>
                        <option value="Oldest -- Newest">Oldest -- Newest</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Result</td><td><input type="text" value="" id="result"/></td>
            </tr>
        </table>
    </form>
</body>
</html> 
<script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
  
<script type="text/javascript">
    var form = $('#form1');
    var x = $('#changeStatus');
    
    x.change(function(){
        $(this).closest(form).submit();
    });
    
    form.submit(function () {
        $.ajax({
        type: form.attr('method'),
        url: form.attr('action'),
        data: form.serialize(),
        success: function (data) {
            var result=data;
            $('#result').attr("value",result);
        }
        });
        return false;
    });
</script>