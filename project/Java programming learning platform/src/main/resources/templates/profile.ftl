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
                        <div class="btn-group">
                            <a href="/user/${uuser.id}/edit" class="btn btn-secondary">Редактировать</a>
                            <a href="/user/${uuser.id}/delete" class="btn btn-secondary">Удалить</a>
                        </div>
                    </#if>
                </li>
                <#if uuser.isTeacher()>
                    <li class="list-group-item">
                        <h5 class="card-title">Модератор курсов</h5>
                        <#if editableCourses?size != 0>
                            <div class="table-responsive">
                                <table class="table table-sm">
                                    <thead>
                                    <tr>
                                        <th scope="col">Название курса</th>
                                        <th scope="col">Студенты</th>
                                        <th scope="col">Модераторы</th>
                                        <#if uuser.id == currentUserId>
                                            <th scope="col">Действия</th>
                                        </#if>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#list editableCourses as course>
                                        <tr>
                                            <td>
                                                <#if course.active??>
                                                    <a href="/course/${course.id}">${course.name}</a>
                                                <#else>
                                                    ${course.name}
                                                </#if>
                                            </td>
                                            <td>
                                                <a href="/course/${course.id}/students"
                                                   class="btn btn-primary">${course.students?size}</a>
                                            </td>
                                            <td><a href="/course/${course.id}/editors"
                                                   class="btn btn-primary">${course.editors?size}</a></td>
                                            <#if uuser.id == currentUserId>
                                                <td>
                                                    <#if course.editors?seq_contains(uuser)>
                                                        <form action="/constructor/course/delete/${course.id}"
                                                              method="get">
                                                            <a class="btn btn-secondary"
                                                               href="/constructor/course/edit/${course.id}">Редактировать</a>
                                                            <button type="submit" class="btn btn-secondary">Удалить
                                                            </button>
                                                        </form>
                                                    </#if>
                                                </td>
                                            </#if>
                                        </tr>
                                    </#list>
                                    </tbody>
                                </table>
                            </div>
                        <#else>
                            Нет модерируемых курс
                        </#if>
                    </li>
                </#if>
                <li class="list-group-item">
                    <h5 class="card-title">Подписан на курсы</h5>
                    <#if courses?size != 0>
                        <div class="table-responsive">
                            <table class="table table-sm">
                                <thead>
                                <tr>
                                    <th scope="col">Название курса</th>
                                    <th scope="col">Студенты</th>
                                    <th scope="col">Модераторы</th>
                                    <#if uuser.id == currentUserId>
                                        <th scope="col">Действия</th>
                                    </#if>
                                </tr>
                                </thead>
                                <tbody>
                                <#list courses as course>
                                    <tr>
                                        <td>
                                            <#if course.active??>
                                                <a href="/course/${course.id}">${course.name}</a>
                                            <#else>
                                                ${course.name}
                                            </#if>
                                        </td>
                                        <td>
                                            <a href="/course/${course.id}/students"
                                               class="btn btn-primary">${course.students?size}</a>
                                        </td>
                                        <td><a href="/course/${course.id}/editors"
                                               class="btn btn-primary">${course.editors?size}</a></td>
                                        <#if uuser.id == currentUserId>
                                            <td>
                                                <form action="/user/${uuser.id}/unsubscribe/${course.id}">
                                                    <button type="submit" class="btn btn-primary">Отписаться</button>
                                                </form>
                                            </td>
                                        </#if>
                                    </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    <#else>
                        Не подписан ни на один курс
                    </#if>
                </li>
                <li class="list-group-item">
                    <h5 class="card-title">Успеваемость</h5>
                    <#if grades??>
                        <div class="table-responsive">
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
                        </div>
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