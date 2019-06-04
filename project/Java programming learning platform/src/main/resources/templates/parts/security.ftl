<#assign
known = Session.SPRING_SECURITY_CONTEXT??
>

<#if known>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    username = user.getUsername()
    isAdmin = user.isAdmin()
    isTeacher = user.isTeacher()
    isUser = user.isUser()
    currentUserId = user.getId()
    >
<#else>
    <#assign
    username = "none"
    isAdmin = false
    isTeacher = false
    isUser = false
    currentUserId = -1
    >
</#if>