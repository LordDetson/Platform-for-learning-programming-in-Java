<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <#if message??>
        <div class="alert alert-danger" role="alert">
            ${message}
        </div>
    </#if>
    <@l.login "/registration" true/>
</@c.page>