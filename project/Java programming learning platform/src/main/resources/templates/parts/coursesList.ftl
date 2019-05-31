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
                            <#list course.editors as editor>
                                <#if editor.id == currentUserId>
                                    <a class="btn btn-primary"
                                       href="/course/edit/${course.id}">Edit</a>
                                </#if>
                            </#list>
                        </footer>
                    </blockquote>
                </div>
            </div>
        <#else>
            NO COURSES
        </#list>
    </div>
</#macro>