<%--
  Created by IntelliJ IDEA.
  User: Minhaz
  Date: 8/19/2020
  Time: 9:41 PM
--%>

<%@ page import="assignment_2.Country" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <script
            src="https://code.jquery.com/jquery-3.5.1.js"
            integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
            crossorigin="anonymous"></script>
    <style>
        button{
            background-color: #1e7e34;
        }
    </style>
</head>

<body>
<div>
    <b>Country:</b>
    <g:select id="country" name="country.id" from="${Country.listOrderByName()}"
    optionKey="id" noSelection="[null: '']"
    onchange="countryChanged(this.value)"
    />
</div>
<div>
    <b>State</b>
    <span id="subContainer"></span>
</div>
<form action="" method="post" id="my_form" novalidate>
    <input type="checkbox" name="showField" id="showField" value="yes" onchange="myFunction()">Display your state<br/>
    <span id="stateField">Your state:<input type="text" name="yourState" id="yourState" required="true"></span><br/>
    <label><span>Division : </span><input type="text" name="division" required="true" /></label><br/>
    <label><span>Name : </span><input type="text" name="name" required="true"  /></label><br/>
    <label><span>Age : </span><input type="number" name="age" required="true" /></label><br/>
    <label><input type="submit" value="Submit Form"></label><br>
</form>
<div id="form"></div>
<br>

<script>

    $('#stateField').css('display','none'); // Hide the text input box in default
    function myFunction() {
        if($('#showField').prop('checked')) {
            $('#stateField').css('display','block');
        } else {
            $('#stateField').css('display','none');
        }
    }
    function countryChanged(countryId) { //function for dynamic dropdown
        jQuery.ajax({type:'POST',data:'countryId='+countryId, url:'${createLink(controller:'form',action:'countryChanged')}',success:function(data,textStatus){jQuery('#subContainer').html(data);},error:function(XMLHttpRequest,textStatus,errorThrown){}});
    }


    $(document).ready(function () {

        $( "#my_form" ).submit(function( event ){
            let proceed = true;

            $("#my_form input[required=true], #my_form textarea[required=true]").each(function(){  //Loops through every text input to check empty
                $(this).css('border-color','');
                if(!$.trim($(this).val())){
                    $(this).css('border-color','red'); //makes border red
                    proceed = false;
                }

            });

            if(proceed){
                return true;
            }
            event.preventDefault();
        });

        $("#my_form input[required=true], #my_form textarea[required=true]").keyup(function() {
            $(this).css('border-color','');
            $("#result").slideUp();
        });

    });

</script>
</body>
</html>