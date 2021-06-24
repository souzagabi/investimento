
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

function verifyConfPassWord(element, elementCompare, elementMsg)
{
    var msg = '';
    if (element.value != elementCompare.value) {
        msg = "Senha não confere! Digite-a novamente.";
    } else if (element.value == elementCompare.value) {
        if (element.value.length < 6) {
            msg = "A senha tem que ser pelo menos 6 caracteres!!";
        } else {
            console.log(document.getElementById("btnSubmit"));
            document.getElementById("btnSubmit").style.display = "inline";
        }
    } 
    if (msg != '') {
        elementMsg.style.display = "block";
        document.getElementById("msgError").innerHTML = msg;
        elementCompare.focus();
        removeMensagemError(elementMsg);
    }

}

function removeMensagemError(element){
    if (element) {
        setTimeout(function(){ 
            element.style.display = "none";  
            document.getElementById("msgError").innerHTML = "";
        }, 3000);
    }
}
function removeMensagem(){
    if (document.getElementById("msg-success")) {
        setTimeout(function(){ 
            var msg = document.getElementById("msg-success");
            msg.parentNode.removeChild(msg);   
        }, 3000);
    }
}
document.onreadystatechange = () => {
    if (document.readyState === 'complete') {
        removeMensagem(); 
    }
};
