<div id="phone${i}" class="phone-div" <g:if test="${hidden}">style="display:none;"</g:if>>
    <g:hiddenField name='phonesList[${i}].id' value='${phone?.id}'/>
    <g:hiddenField name='phonesList[${i}].deleted' value='false'/>
    <g:hiddenField name='phonesList[${i}].new' value='false'/>
 
    <g:textField name='phonesList[${i}].number' value='${phone?.number}' />


 
    <span class="del-phone">
        <img src="${resource(dir:'images/skin', file:'icon_delete.png')}"
            style="vertical-align:middle;"/>
    </span>
</div>