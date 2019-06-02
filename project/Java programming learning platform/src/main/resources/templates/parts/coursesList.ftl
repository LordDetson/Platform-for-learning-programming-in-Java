<#include "security.ftl">

<#macro coursesList courses>
    <div class="card-columns">
        <#list courses as course>
            <div class="card my-3">
                <div class="card-header">
                    <a href="/course/${course.id}">${course.name}</a>
                </div>
                <#if course.imgName??>
                    <img class="card-img-top" src="/img/${course.imgName}">
                </#if>
                <div class="card-body">
                    <blockquote class="blockquote mb-0">
                        <p>${course.description}</p>
                        <footer class="blockquote-footer">
                            Course editors
                            <#list course.editors as editor>
                                <a href="/user-profile/${editor.id}">
                                    <cite title="Source Title">${editor.username}</cite>
                                </a>
                            </#list>
                        </footer>
                    </blockquote>
                    <#list course.editors as editor>
                        <#if editor.id == currentUserId>
                            <form action="/constructor/course/delete/${course.id}" method="get">
                                <a class="btn btn-primary"
                                   href="/constructor/course/edit/${course.id}">Редактировать</a>
                                <button type="submit" class="btn btn-primary">Удалить</button>
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