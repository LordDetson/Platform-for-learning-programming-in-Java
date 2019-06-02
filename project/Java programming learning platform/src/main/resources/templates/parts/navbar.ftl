<#include "security.ftl">
<#import "login.ftl" as l>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="/">Learning platform</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/">Home</a>
            </li>
            <#--<li class="nav-item">
                <a class="nav-link" href="/messages">Messages</a>
            </li>
            <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link" href="/user">List of users</a>
                </li>
            </#if>
            <#if user??>
                <li class="nav-item">
                    <a class="nav-link" href="/user/profile">Your profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/user-messages/${currentUserId}">My message</a>
                </li>
            </#if>-->
            <#if isAdmin>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="/constructor" id="navbarDropdownMenuLink" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Constructor
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="/constructor/course">Course</a>
                        <a class="dropdown-item" href="#">Test</a>
                        <a class="dropdown-item" href="#">Practice</a>
                    </div>
                </li>
            </#if>
        </ul>
        <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
        <ul class="navbar-nav px-1">
            <li class="nav-item text-nowrap">
                <a class="nav-link" href="#"><#if user??>${username}<#else>Please, login</#if></a>
            </li>
            <li class="nav-item text-nowrap">
                <@l.logout/>
            </li>
        </ul>
    </div>
</nav>