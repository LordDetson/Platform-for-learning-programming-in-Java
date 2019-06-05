<#include "security.ftl">

<#macro coursesList courses>
    <div class="card-columns">
        <#list courses as course>
            <div class="card my-3">
                <div class="card-header">
                    <h4><a href="/course/${course.id}">${course.name}</a></h4>
                </div>
                <#if course.imgName??>
                    <img class="card-img-top" src="/img/${course.imgName}">
                </#if>
                <div class="card-body">
                    <#if user??>
                        <#if course.students?seq_contains(user)>
                            <form action="/user/${user.id}/unsubscribe/${course.id}">
                                    <button type="submit" class="btn btn-primary mb-2">
                                        Отписаться <span class="badge badge-light">${course.students?size}</span>
                                    </button>
                            </form>
                        <#else>
                            <form action="/user/${user.id}/subscribe/${course.id}">
                                    <button type="submit" class="btn btn-primary mb-2">
                                        Подписаться <span class="badge badge-light">${course.students?size}</span>
                                    </button>
                            </form>
                        </#if>
                    </#if>
                    <blockquote class="blockquote mb-2">
                        <p>${course.description}</p>
                        <footer class="blockquote-footer">
                            Модераторы
                            <#list course.editors as editor>
                                <a href="/user/${editor.id}">
                                    <cite title="Source Title">${editor.username}</cite>
                                </a>
                            </#list>
                        </footer>
                    </blockquote>
                    <#if course.editors?seq_contains(user)>
                        <form action="/constructor/course/delete/${course.id}" method="get">
                            <a class="btn btn-secondary"
                               href="/constructor/course/edit/${course.id}">Редактировать</a>
                            <button type="submit" class="btn btn-secondary">Удалить</button>
                        </form>
                    </#if>
                </div>
            </div>
        <#else>
            NO COURSES
        </#list>
    </div>
</#macro>