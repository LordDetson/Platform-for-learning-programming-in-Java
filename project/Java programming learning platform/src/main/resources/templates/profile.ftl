<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">
<@c.page>
    <h3>Профиль пользователя ${uuser.username}</h3>
    <div class="card">
        <div class="card-header">
            ${uuser.username}
        </div>
        <div class="card-body">
            <ul class="list-group list-group-flush">
                <li class="list-group-item">
                    <dl class="row">
                        <dt class="col-sm-3">Emil</dt>
                        <dd class="col-sm-9">${uuser.email}</dd>
                    </dl>
                    <#if uuser.id == currentUserId>
                        <a href="/user/${uuser.id}/edit" class="btn btn-primary">Редактировать</a>
                    </#if>
                </li>
                <li class="list-group-item">
                    <h5 class="card-title">Ваши курсы</h5>
                    <#list courses as course>
                        <table class="table table-sm">
                            <thead>
                            <tr>
                                <th scope="col">Название курса</th>
                                <th scope="col">Студенты</th>
                                <th scope="col">Модераторы</th>
                                <th scope="col">Отписаться</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>${course.name}</td>
                                <td>
                                    <a href="/course/${course.id}/students"
                                       class="btn btn-primary">${course.students?size}</a>
                                </td>
                                <td><a href="/course/${course.id}/editors"
                                       class="btn btn-primary">${course.editors?size}</a></td>
                                <td>
                                    <form action="/user/${uuser.id}/unsubscribe/${course.id}">
                                        <button type="submit" class="btn btn-primary">Отписаться</button>
                                    </form>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    <#else>
                        Не подписан ни на один курс
                    </#list>
                </li>
                <li class="list-group-item">
                    <h5 class="card-title">Успеваемость</h5>
                    <#if grades??>
                        <table class="table table-sm">
                            <thead>
                            <tr>
                                <#list grades as grade>
                                    <th scope="col">${grade.date}</th>
                                </#list>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <#list grades as grade>
                                    <th scope="col">${grade.grade}</th>
                                </#list>
                            </tr>
                            </tbody>
                        </table>
                    <#else>
                        Нет оценок
                    </#if>
                </li>
            </ul>
        </div>
        <div class="card-footer text-muted">
            Статус аккаунта <#list roles as role>${role}<#sep>, </#list>
        </div>
    </div>
</@c.page>