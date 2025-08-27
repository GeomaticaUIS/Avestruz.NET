
        
        $(document).ready(function(){

            var marca = "(día/mes/año)";
        if ($("input[id*='Txt_fecha']").val() == "")
        { $("input[id*='Txt_fecha']").val(marca); }
        $("input[id*='Txt_fecha']").focus(function () {
            if ($(this).val() == marca) { $(this).val(""); } 
        }).blur(function () {
            if ($(this).val() == "") { $(this).val(marca); } 
        });

    });
