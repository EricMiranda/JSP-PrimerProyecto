/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function fechaDeHoy(){
                var f = new Date();
                if (f.getDate() < 10) {
                        var dia = "0" + f.getDate();
                }else{
                        var dia = f.getDate();
                }
                if ((f.getMonth()+1) < 10) {
                        var mes = "0" + (f.getMonth()+1);
                }else{
                        var mes = (f.getMonth()+1);
                }
                document.getElementById("fecha").value = f.getFullYear() + "-" + mes + "-" + dia;
            };
function val(e) {
    tecla = (document.all) ? e.keyCode : e.which;
    if (tecla==8) return true;
    patron =/[A-Za-z ]/;
    te = String.fromCharCode(tecla);
    return patron.test(te);
}

function soloNumeros(evt) {
    var theEvent = evt || window.event;
    var key = theEvent.keyCode || theEvent.which;
    key = String.fromCharCode(key);
    var regex = /[0-9]/;
    if (!regex.test(key)) {
        theEvent.returnValue = false;
        if (theEvent.preventDefault)
            theEvent.preventDefault();
    }
}