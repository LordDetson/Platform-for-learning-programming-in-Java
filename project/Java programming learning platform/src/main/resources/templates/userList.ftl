<#import "parts/common.ftl" as c>
<@c.page>
    <h3>Зарегестрированные пользователи</h3>
    <table class="table">
        <thead class="thead-dark">
        <tr>
            <th scope="col">#</th>
            <th scope="col">Наименование</th>
            <th scope="col">Email</th>
            <th scope="col">Роли</th>
            <th scope="col">Действия</th>
        </tr>
        </thead>
        <tbody>
        <#list userList as user>
            <tr>
                <th scope="row">${user.id}</th>
                <td>${user.username}</td>
                <td>${user.email}</td>
                <td>
                    <#if userEditId?? && userEditId == user.id>
                        <#list roles as role>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="checkbox" name="${role}"
                                           form="userRole${user.id}" ${user.roles?seq_contains(role)?string("checked", "")}>
                                    ${role}
                                </label>
                            </div>
                        </#list>
                    <#else>
                        <#list user.roles as role>${role}<#sep>, </#list>
                    </#if>
                </td>
                <td>
                    <form action="/admin/user/${user.id}" method="post" id="userRole${user.id}">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <div class="btn-group">
                            <#if userEditId?? && userEditId == user.id>
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
        </#list>
        </tbody>
    </table>
</@c.page>