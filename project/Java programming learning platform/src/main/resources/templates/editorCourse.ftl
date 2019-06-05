<#import "parts/common.ftl" as c>
<#import "parts/editorCourse.ftl" as ec>
<@c.page>
    <@ec.editorCourse false/>
    <div class="table-responsive">
    <table class="table table-sm">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Название темы</th>
            <th scope="col">Количество страниц</th>
            <th scope="col">Действия</th>
        </tr>
        </thead>
        <tbody>
        <#list course.topics as topic>
            <tr>
                <th scope="row">
                    <#if topicEditId?? && topicEditId == topic.id>
                        <input type="number" class="form-control" placeholder="Номер темы" form="editTopic${topic.id}"
                               name="priority" value="${topic.priority}">
                    <#else>
                        ${topic.priority}
                    </#if>
                </th>
                <td>
                    <#if topicEditId?? && topicEditId == topic.id>
                        <input type="text" class="form-control" placeholder="Название темы" form="editTopic${topic.id}"
                               name="name" value="${topic.name}">
                    <#else>
                        ${topic.name}
                    </#if>
                </td>
                <td>
                    <a class="btn btn-primary" class="btn btn-secondary" data-toggle="collapse"
                       href="#pagesList${topic.id}" role="button" aria-expanded="false"
                       aria-controls="pagesList">
                        ${topic.pages?size}
                    </a>
                </td>
                <td>
                    <form action="/constructor/course/${course.id}/topic/${topic.id}" method="get"
                          id="editTopic${topic.id}">
                        <div class="btn-group">
                            <#if topicEditId?? && topicEditId == topic.id>
                                <button type="submit" class="btn btn-secondary" name="action" value="save">Сохранить
                                </button>
                            <#else>
                                <button type="submit" class="btn btn-secondary" name="action" value="edit">Редактировать
                                </button>
                            </#if>
                            <button type="submit" class="btn btn-secondary" name="action" value="delete">Удалить
                            </button>
                        </div>
                    </form>
                </td>
            </tr>
            <tr>
                <td></td>
                <td colspan="3">
                    <div class="collapse" id="pagesList${topic.id}">
                        <div class="table-responsive">
                            <table class="table table-sm">
                                <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Название страницы</th>
                                    <th scope="col">Действия</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list topic.pages as page>
                                    <tr <#if !page.path??>class="table-warning"</#if>>
                                        <th scope="row">${page.priority}</th>
                                        <td>${page.name}</td>
                                        <td>
                                            <form action="/constructor/course/${course.id}/topic/${topic.id}/page/${page.id}"
                                                  method="get">
                                                <div class="btn-group" role="group" aria-label="Basic example">
                                                    <button type="submit" class="btn btn-secondary" name="action"
                                                            value="edit">
                                                        Редактировать
                                                    </button>
                                                    <button type="submit" class="btn btn-secondary" name="action"
                                                            value="delete">Удалить
                                                    </button>
                                                </div>
                                            </form>
                                        </td>
                                    </tr>
                                <#else>
                                    <tr>
                                        <td>NO PAGES</td>
                                    </tr>
                                </#list>
                                <tr>
                                    <td colspan="3">
                                        <form action="/constructor/course/${course.id}/topic/${topic.id}/page/create"
                                              method="get">
                                            <div class="form-row">
                                                <div class="col">
                                                    <input type="number" class="form-control"
                                                           placeholder="Номер страницы"
                                                           name="priority"
                                                           value="${topic.lastPriorityPage + 1}">
                                                </div>
                                                <div class="col">
                                                    <input type="text" class="form-control"
                                                           placeholder="Название страницы"
                                                           name="name">
                                                </div>
                                                <div class="col">
                                                    <button type="submit" class="btn btn-primary">Добавить страницу
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </td>
            </tr>
        <#else>
            <tr>
                <td>NO TOPICS</td>
            </tr>
        </#list>
        <tr>
            <td colspan="4">
                <form action="/constructor/course/${course.id}/topic/create" method="get">
                    <div class="form-row">
                        <div class="col">
                            <input type="number" class="form-control" placeholder="Номер темы" name="priority"
                                   value="${course.lastPriorityPage + 1}">
                        </div>
                        <div class="col">
                            <input type="text" class="form-control" placeholder="Название темы" name="name">
                        </div>
                        <div class="col">
                            <button type="submit" class="btn btn-primary">Добавить тему</button>
                        </div>
                    </div>
                </form>
            </td>
        </tr>
        </tbody>
    </table>
    <div class="table-responsive">
</@c.page>