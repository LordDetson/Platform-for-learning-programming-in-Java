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
                <a class="nav-link" href="/">Главная</a>
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
                        Конструкторы
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="/constructor/course">Крсов</a>
                        <a class="dropdown-item" href="#">Тестов</a>
                        <a class="dropdown-item" href="#">Практики</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/admin/userList">Пользователи</a>
                </li>
            </#if>
        </ul>
        <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
        <ul class="navbar-nav px-1">
            <li class="nav-item text-nowrap">
                <#if user??>
                <a class="nav-link" href="/user/${user.id}">${username}</a>
                <#else>
                <span class="nav-link">Please, login</span>
                </#if>
            </li>
            <li class="nav-item text-nowrap">
                <@l.logout/>
            </li>
        </ul>
    </div>
</nav>