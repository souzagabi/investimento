function sumTotal(qtde, elementUnit, elementTotal, elementAverage)
{
    
    elementUnit.value = replaceComa(elementUnit);

    if (qtde >= 0 && elementUnit.value >= 0) {
        var total =  qtde * elementUnit.value;
        var average = 0;
        if (qtde > 0) {
            average = total / qtde;
        }
        elementTotal.value = total.toFixed(2);
        elementAverage.value = average.toFixed(2);

       if (document.getElementById("prcsell").value != '' && document.getElementById("prcsell").value >= 0) 
       {
            
            var vlbuy  = document.getElementById("tlbuy").value;
            var vlsell = document.getElementById("tlsell").value;
    
            var lucre = vlsell - vlbuy;
            var tax = 0;
            
            if ((lucre < 0 || lucre > 0) && vlbuy != 0) {
                tax = ((lucre*100)/vlbuy);
            } else {
                if (vlbuy == 0 && vlsell > 0) {
                    tax = 100;
                } else {
                    tax = 0;
                }
            }
            document.getElementById("lucre").value = lucre.toFixed(2);
            document.getElementById("tax").value = tax.toFixed(2)+" %";
        } else {
            document.getElementById("prcsell").value = '';
            document.getElementById("qtdesell").value = '';
            document.getElementById("sprcaverage").value = '';
            document.getElementById("tlsell").value = '';
            document.getElementById("lucre").value = '';
            document.getElementById("tax").value = '';
        }
    }
 
    return total;
}

function replaceComa(element)
{
    var v = element.value.replace(/,/g, '.');
    document.getElementById(element.name).value = v;
    return v ;
}

function replaceSlash(element)
{
    var dt = element.value.replace(/[\/\-]/g, '-');
    document.getElementById(element.name).value = dt;
}

function convertLowToUpper(element)
{
    var company = element.value;
    if(company != '' || company != NULL)
    {
        document.getElementById(element.name).value = company.toUpperCase();
        
    }
}

function removeMensagemError(element){
    if (element) {
        setTimeout(function(){ 
            element.style.display = "none";  
            document.getElementById("msgError").innerHTML = "";
        }, 2000);
    }
}

function removeMensagem(){
    if (document.getElementById("msg-success")) {
        setTimeout(function(){ 
            var msg = document.getElementById("msg-success");
            msg.parentNode.removeChild(msg);   
        }, 2000);
    }
    if (document.getElementById("msg-danger")) {
        setTimeout(function(){ 
            var msg = document.getElementById("msg-danger");
            msg.parentNode.removeChild(msg);   
        }, 2000);
    }
}

document.onreadystatechange = () => {
    if (document.readyState === 'complete') {
        removeMensagem(); 
    }
};
    