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
            <#if isTeacher>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Конструкторы
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="/constructor/course">Курсов</a>
                        <a class="dropdown-item" href="#">Тестов</a>
                        <a class="dropdown-item" href="#">Практики</a>
                    </div>
                </li>
            </#if>
            <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link" href="/admin/userList">Пользователи</a>
                </li>
            </#if>
        </ul>
        <form action="/course/search" method="get">
            <input class="form-control form-control-dark w-100" type="text" placeholder="Поиск курса"
                   aria-label="Поиск курса" name="valueSearch">
        </form>
        <ul class="navbar-nav px-1">
            <li class="nav-item text-nowrap">
                <#if user??>
                    <a class="nav-link" href="/user/${(user.id)!}">${username}</a>
                <#else>
                    <a class="nav-link" href="/registration">Регистрация</a>
                </#if>
            </li>
            <li class="nav-item text-nowrap">
                <@l.logout/>
            </li>
        </ul>
    </div>
</nav>