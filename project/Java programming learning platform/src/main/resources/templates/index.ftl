<#import "parts/common.ftl" as c>
<#import "parts/coursesList.ftl" as cl>
<#include "parts/security.ftl">
<@c.page>
    <h1>Welcome, Java programming learning platform!</h1>
    <#if isAdmin>
        <h3>Редактируемые вами курсы</h3>
        <@cl.coursesList coursesEdit/>
    </#if>
    <h3>Активные курсы</h3>
    <@cl.coursesList courses/>
</@c.page>