$(function(){
    $('select[name=emailSelection]').change(function() {
        if($(this).val()=="1"){
            $('#domain').val("");
        } else {
            $('#domain').val($(this).val());
            $("#domain").attr("readonly", true);
        }
    });
}); //end $(function)
