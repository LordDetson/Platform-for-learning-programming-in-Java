<#import "parts/common.ftl" as c>
<@c.page>
    <h3>${name}</h3>
    ${content}
    <form action="/constructor/course/${course.id}/topic/${topic.id}/page/${page.id}/save" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        <input type="hidden" name="name" value="${name}">
        <input type="hidden" name="priority" value="${priority}">
        <input type="hidden" name="contentBit" value="${contentBit}">
        <button type="submit" class="btn btn-primary">Сохранить</button>
    </form>
</@c.page>