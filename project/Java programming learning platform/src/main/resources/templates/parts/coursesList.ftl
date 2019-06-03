<#include "security.ftl">

<#macro coursesList courses>
    <div class="card-columns">
        <#list courses as course>
            <div class="card my-3">
                <div class="card-header">
                    <h5 class="card-title"><a href="/course/${course.id}">${course.name}</a></h5>
                </div>
                <#if course.imgName??>
                    <img class="card-img-top" src="/img/${course.imgName}">
                </#if>
                <div class="card-body">

                    <blockquote class="blockquote mb-0">
                        <p>${course.description}</p>
                        <#if user??>
                            <#if course.students?seq_contains(user)>
                                <form action="/user/${user.id}/unsubscribe/${course.id}">
                                    <button type="submit" class="btn btn-primary">Отписаться</button>
                                </form>
                            <#else>
                                <form action="/user/${user.id}/subscribe/${course.id}">
                                    <button type="submit" class="btn btn-primary">Подписаться</button>
                                </form>
                            </#if>
                        </#if>
                        <footer class="blockquote-footer">
                            Course editors
                            <#list course.editors as editor>
                                <a href="/user/${editor.id}">
                                    <cite title="Source Title">${editor.username}</cite>
                                </a>
                            </#list>
                        </footer>
                    </blockquote>
                    <#list course.editors as editor>
                        <#if editor.id == currentUserId>
                            <form action="/constructor/course/delete/${course.id}" method="get">
                                <a class="btn btn-secondary"
                                   href="/constructor/course/edit/${course.id}">Редактировать</a>
                                <button type="submit" class="btn btn-secondary">Удалить</button>
                            </form>
                        </#if>
                    </#list>
                </div>
            </div>
        <#else>
            NO COURSES
        </#list>
    </div>
</#macro>