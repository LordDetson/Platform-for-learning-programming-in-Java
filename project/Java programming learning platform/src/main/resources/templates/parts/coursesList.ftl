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
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="unsubscribe">${course.students?size}</span>
                                    </div>
                                    <button type="submit" class="btn btn-primary" aria-describedby="unsubscribe">
                                        Отписаться
                                    </button>
                                </div>
                            </form>
                        <#else>
                            <form action="/user/${user.id}/subscribe/${course.id}">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="subscribe">${course.students?size}</span>
                                    </div>
                                    <button type="submit" class="btn btn-primary" aria-describedby="subscribe">
                                        Подписаться
                                    </button>
                                </div>
                            </form>
                        </#if>
                    </#if>
                    <blockquote class="blockquote mb-0">
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